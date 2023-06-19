import json
import random
import string
import jwt
import uvicorn
from fastapi import FastAPI, WebSocket, UploadFile, File, Depends
from jwt import InvalidSignatureError, ExpiredSignatureError, DecodeError
from starlette.requests import Request
from starlette.responses import Response, JSONResponse, FileResponse
from starlette.websockets import WebSocketDisconnect
from fastapi import HTTPException
from model import *
import db

app = FastAPI()
secret='my_super_secret_key_hahah'

def jsonify(d): return json.dumps(d,default=str,ensure_ascii=False)

def get_random_string(length):
    characters = string.ascii_letters + string.digits
    result_str = ''.join(random.choice(characters) for i in range(length))
    return result_str

def verify_token(headers):
    if 'Authorization' in headers:
        auth=headers['Authorization']
        if auth.startswith('Bearer '):
            jwt_token = auth.replace('Bearer ','')
            try:
                payload = jwt.decode(jwt_token, key=secret, algorithms=['HS256', ])
                uid = payload['uid']
                return uid
            except (InvalidSignatureError, ExpiredSignatureError,DecodeError):
                return None
    return None

def auth_user(req: Request):
    v=verify_token(req.headers)
    if v:
        return str(v)
    else:
        raise HTTPException(401)


@app.post("/api/signup")
async def signup_user(user: UserSignup):
    user = await db.signup_user(user.fullname, user.email, user.password,user.phone_number)
    if user:
        payload_data = {'uid': user['uid']}
        token = jwt.encode(payload=payload_data,key=secret)
        res={"message": "ok","user":user,"access-token": token}

        return Response(jsonify(res), media_type="application/json")
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
        return JSONResponse(content={"message": "failed"})


@app.post("/api/uploadimage")
async def upload_image(file: UploadFile = File(...), uid:str = Depends(auth_user)):
    if not file.content_type.startswith('image/'):
        return HTTPException(status_code=400, detail="Invalid file")

    upload_folder = "images/"
    file_location = upload_folder + get_random_string(32)+'.'+file.filename.split('.')[-1]
    with open(file_location,'wb') as image:
        image.write(await file.read())
        image.close()

    image_id= await db.add_image(file_location)

    return JSONResponse(content={"image_id": image_id})


@app.get("/api/image")
async def get_image_by_id(image_id):
    image_url = await db.get_url_of_image(image_id)
    if image_url:
        return FileResponse(image_url)
    else:
        return HTTPException(404)

@app.get("/api/cities")
async def get_cities():
    cities=await db.get_cities()
    return Response(jsonify(cities), media_type="application/json")

@app.get("/api/categories")
async def get_categories():
    categories=await db.get_categories()
    return Response(jsonify(categories), media_type="application/json")

@app.get("/api/contact_info")
async def get_coontact_info_of_user(uid):
    phone_number = await db.get_phone_number_of_user(uid)
    if phone_number:
        res={"uid":uid, "phone_number": phone_number}
        return Response(jsonify(res), media_type="application/json")
    else:
        return HTTPException(404)

@app.get("/api/ad")
async def get_ad(ad_id):
    ad=await db.get_ad(ad_id)
    return Response(jsonify(ad), media_type="application/json")

@app.post("/api/ad/create")
async def create_ad(ad: CreateAd, uid:str = Depends(auth_user)):
    res=await db.create_ad(ad,uid)
    return JSONResponse(content={"status": "ok"}) if res else HTTPException(400)

@app.post("/api/ad/edit")
async def edit_ad(edit: EditAd, uid:str = Depends(auth_user)):
    res=await db.edit_ad(edit,uid)
    return JSONResponse(content={"status": "ok"}) if res else HTTPException(400)

@app.get("/api/ad/remove")
async def remove_ad(ad_id, uid:str = Depends(auth_user)):
    res=await db.remove_ad(ad_id,uid)
    return JSONResponse(content={"status": "ok"}) if res else HTTPException(400)

@app.post("/api/ad/search")
async def search_ads(filters: SearchAd):
    res=await db.search_ads(filters)
    return Response(jsonify(res), media_type="application/json")

@app.get("/api/bookmark")
async def get_bookmarks(uid:str = Depends(auth_user)):
    res=await db.get_bookmarks_of_user(uid)
    return Response(jsonify(res), media_type="application/json")

@app.get("/api/bookmark/create")
async def create_bookmark(ad_id, uid:str = Depends(auth_user)):
    res=await db.create_bookmark(uid,ad_id)
    return JSONResponse(content={"status": "ok"}) if res else HTTPException(400)

@app.get("/api/bookmark/remove")
async def remove_bookmark(ad_id, uid:str = Depends(auth_user)):
    res=await db.remove_bookmark(uid,ad_id)
    return JSONResponse(content={"status": "ok"}) if res else HTTPException(400)

class WsConnectionManager:
    def __init__(self):
        self.active_connections: dict[str, WebSocket] = {}

    async def connect(self, websocket: WebSocket, uid: str):
        await websocket.accept()
        self.active_connections[uid] = websocket

    def disconnect(self, uid: str):
        self.active_connections.pop(uid)

    async def send_private_message(self,message: str, sender: str, recipient: str)->bool:
        if recipient in self.active_connections:
            msg={"status":"update","new_msg":message,"sender":sender}
            await self.active_connections[recipient].send_text(jsonify(msg))
        await db.add_message(message, sender, recipient)

ws_manager = WsConnectionManager()

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    uid=verify_token(websocket.headers)

    if uid:
        await ws_manager.connect(websocket, uid)
        try:
            while True:
                data = await websocket.receive_text()

                try:
                    j = json.loads(data)
                    func = j['func']
                    if func == 'message':
                        await ws_manager.send_private_message(j["message_body"], uid, j["recipient"])
                        await websocket.send_text(jsonify({"status": "ok"}))
                    elif func == 'get_user_fullname':
                        data = {"status": "ok", "fullname": await db.get_user_fullname(j['uid'])}
                        await websocket.send_text(jsonify(data))
                    elif func == 'get_chat_list':
                        data = {"status": "ok", "list": await db.get_chatlist_of_user(uid)}
                        await websocket.send_text(jsonify(data))
                    elif func == 'get_room_messages':
                        data = {"status": "ok",
                                "messages": await db.get_messages_of_room(uid, j['cid'], j['limit'], j['offset'])}
                        await websocket.send_text(jsonify(data))
                    else:
                        raise ValueError()

                except (ValueError,KeyError):
                    err = {"status": "error", "code": 400}
                    await websocket.send_text(jsonify(err))

        except WebSocketDisconnect:
            ws_manager.disconnect(uid)

    else:
        await websocket.close()


@app.on_event("startup")
async def startup_event():
    db.pg_pool=await db.get_pg_pool()
    print('Postgresql pool opened.')


@app.on_event("shutdown")
async def shutdown_event():
    await db.pg_pool.close()
    print('Postgresql pool closed.')



