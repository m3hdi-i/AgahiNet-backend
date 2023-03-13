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
            await self.active_connections[recipient].send_text(message + f" [from {sender}]")
        await db.add_message(message, sender, recipient)


manager = ConnectionManager()


@app.websocket("/ws/{user_id}")
async def websocket_endpoint(websocket: WebSocket, user_id: str):
    await manager.connect(websocket, user_id)
    try:
        while True:
            data = await websocket.receive_text()
            j = json.loads(data)
            await manager.send_private_message(j["message_body"],str(user_id), j["recipient"])

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
