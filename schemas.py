from pydantic import BaseModel

# pydantic khai báo thuộc tính sử dụng (name: str):, còn SQLAlchemy  khai báo thuộc tính sử dụng =  (name = Column(String))
class ItemBase(BaseModel):
    title: str
    description: str | None = None


class ItemCreate(ItemBase):
    pass


class Item(ItemBase):
    id: int
    owner_id: int

    class Config:
        from_attributes = True


class UserBase(BaseModel):
    email: str


class UserCreate(UserBase):
    password: str


class User(UserBase):
    id: int
    is_active: bool
    items: list[Item] = []

    class Config:
        from_attributes = True