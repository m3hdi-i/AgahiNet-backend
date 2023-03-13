import json
import uvicorn
from fastapi import FastAPI, WebSocket
from starlette.websockets import WebSocketDisconnect

import db

app = FastAPI()

class ConnectionManager:
    def __init__(self):
        self.active_connections: dict[str, WebSocket] = {}

    async def connect(self, websocket: WebSocket, uid: str):
        await websocket.accept()
        self.active_connections[uid] = websocket

    def disconnect(self, uid: str):
        self.active_connections.pop(uid)

    async def send_private_message(self,message: str, sender: str, recipient: str):
        if recipient in self.active_connections:
            msg={"new_msg":message,"sender":sender}
            await self.active_connections[recipient].send_text(jsonify(msg))
        await db.add_message(message, sender, recipient)

manager = ConnectionManager()

def jsonify(d): return json.dumps(d,default=str,ensure_ascii=False)

@app.websocket("/ws/{user_id}")
async def websocket_endpoint(websocket: WebSocket, user_id: str):
    await manager.connect(websocket, user_id)
    try:
        while True:
            data = await websocket.receive_text()
            try:
                j = json.loads(data)
                func= j['func']
                if func=='message':
                    await manager.send_private_message(j["message_body"],user_id, j["recipient"])
                elif func=='get_user_name':
                    data = {"status": "ok","name":await db.get_user_name( j['uid'])}
                    await websocket.send_text(jsonify(data))
                elif func=='get_chat_list':
                    data = {"status": "ok","list":await db.get_chatlist_of_user( j['uid'])}
                    await websocket.send_text(jsonify(data))
                elif func=='get_room_messages':
                    data = {"status": "ok","messages":await db.get_messages_of_room(j['u1'],j['u2'],j['limit'],j['offset'])}
                    await websocket.send_text(jsonify(data))
                else:
                    err = {"status": "error"}
                    await websocket.send_text(jsonify(err))

            except KeyError:
                err = {"status": "error"}
                await websocket.send_text(jsonify(err))

    except WebSocketDisconnect:
        manager.disconnect(user_id)


@app.on_event("startup")
async def startup_event():
    db.pg_pool=await db.get_pg_pool()
    print('Postgresql pool opened.')


@app.on_event("shutdown")
async def shutdown_event():
    await db.pg_pool.close()
    print('Postgresql pool closed.')


uvicorn.run(app)
