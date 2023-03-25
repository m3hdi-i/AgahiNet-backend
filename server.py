import json

import jwt
import uvicorn
from fastapi import FastAPI, WebSocket
from jwt import InvalidSignatureError, ExpiredSignatureError
from starlette.responses import Response, JSONResponse
from starlette.websockets import WebSocketDisconnect
from fastapi import HTTPException
from model import *
import db

app = FastAPI()
secret='my_super_secret_key_hahah'

def jsonify(d): return json.dumps(d,default=str,ensure_ascii=False)


@app.post("/api/signup")
async def signup_user(user: UserSignup):
    user = await db.signup_user(user.fullname, user.email, user.password)
    if user:
        payload_data = {'uid': user['uid']}
        token = jwt.encode(payload=payload_data,key=secret)
        res={"message": "ok","user":user,"access-token": token}

        return JSONResponse(content=res)
    else:
        return JSONResponse(content={"message": "failed"})


@app.post("/api/signin")
async def signin_user(user: UserSignin):
    user = await db.authenticate_user(user.email,user.password)
    if user:
        payload_data = {'uid': user['uid']}
        token = jwt.encode(payload=payload_data, key=secret)
        res = {"message": "ok","user":user, "access-token": token}
        return Response(jsonify(res), media_type="application/json")

    else:
        raise HTTPException(status_code=401, detail="Incorrect email or password")



class WsConnectionManager:
    def __init__(self):
        self.active_connections: dict[str, WebSocket] = {}

    async def connect(self, websocket: WebSocket, uid: str):
        await websocket.accept()
        self.active_connections[uid] = websocket

    def disconnect(self, uid: str):
        self.active_connections.pop(uid)

    async def send_private_message(self,message: str, sender: str, recipient: str):
        if recipient in self.active_connections:
            msg={"status":"update","new_msg":message,"sender":sender}
            await self.active_connections[recipient].send_text(jsonify(msg))
        await db.add_message(message, sender, recipient)

manager = WsConnectionManager()

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    uid = None

    if 'Authorization' in websocket.headers:
        if websocket.headers['Authorization'].startswith('Bearer '):
            jwt_token=websocket.headers['Authorization'].split(' ')[1]
            try:
                payload = jwt.decode(jwt_token, key=secret, algorithms=['HS256', ])
                uid = payload['uid']
            except (InvalidSignatureError, ExpiredSignatureError):
                err = {"status": "error", "code": 401}
                await websocket.send_text(jsonify(err))

    if uid:
        await manager.connect(websocket, uid)
        try:
            while True:
                data = await websocket.receive_text()

                try:
                    j = json.loads(data)
                    func= j['func']
                    if func=='message':
                        await manager.send_private_message(j["message_body"],uid, j["recipient"])
                    elif func=='get_user_fullname':
                        data = {"status": "ok","fullname":await db.get_user_fullname(j['uid'])}
                        await websocket.send_text(jsonify(data))
                    elif func=='get_chat_list':
                        data = {"status": "ok","list":await db.get_chatlist_of_user(uid)}
                        await websocket.send_text(jsonify(data))
                    elif func=='get_room_messages':
                        data = {"status": "ok","messages":await db.get_messages_of_room(uid,j['cid'],j['limit'],j['offset'])}
                        await websocket.send_text(jsonify(data))
                    else:
                        err = {"status": "error"}
                        await websocket.send_text(jsonify(err))

                except KeyError:
                    err = {"status": "error","code":400}
                    await websocket.send_text(jsonify(err))

        except WebSocketDisconnect:
            manager.disconnect(uid)


@app.on_event("startup")
async def startup_event():
    db.pg_pool=await db.get_pg_pool()
    print('Postgresql pool opened.')


@app.on_event("shutdown")
async def shutdown_event():
    await db.pg_pool.close()
    print('Postgresql pool closed.')


uvicorn.run(app)
