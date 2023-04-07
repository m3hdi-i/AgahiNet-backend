from typing import List, Optional

from decimal import Decimal
from pydantic import BaseModel

class UserSignin(BaseModel):
    email: str
    password: str

class UserSignup(BaseModel):
    fullname:str
    email: str
    password: str
    phone_number:str

class CreateAd(BaseModel):
    title:str
    description:str
    price:Optional[Decimal]
    category:int
    city:int
    images_list: Optional[List[str]]
    main_image_id:Optional[str]


class SearchAd(BaseModel):
    keyword: Optional[str]
    category: Optional[int]
    cities: Optional[List[int]]
    min_price: Optional[Decimal]
    max_price: Optional[Decimal]
    limit: int
    offset: int

class EditAd(BaseModel):
    ad_id: str
    title:str
    description:str
    price:Optional[Decimal]
    category:int
    city:int
    images_list_old: Optional[List[str]]
    images_list_new: Optional[List[str]]
    main_image_id: Optional[str]