from pydantic import BaseModel

class UserSignin(BaseModel):
    email: str
    password: str

class UserSignup(BaseModel):
    fullname:str
    email: str
    password: str