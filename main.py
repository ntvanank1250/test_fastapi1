from typing import Union, Optional
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

@app.get("/") # khai báo phương thức get, url
def read_root():
    return {"Hello: World"}

class Item(BaseModel): # kế thừa từ class Basemodel và khai báo các biến
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

@app.post("/items/")
def create_item(item: Item):
    return item

@app.get("/items/{item_id}")
def read_item(item_id: str, short: bool = False): # param short với định dạng boolean có giá trị mặc định là False
    item = {"item_id": item_id}
    if not short:
        item.update(
            {"description": "This is an amazing item that has a long description"}
        )
    return item

