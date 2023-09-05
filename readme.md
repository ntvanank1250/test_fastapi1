Mô tả :
Dựng 2 server trả qua 2 port là 8000 và 8080 bằng fastapi sử dụng nginx <có sử dụng cache>

# Khoi chay local:<window>
pip install -r requirements.txt
source test_fastapi/bin/activate
uvicorn main:app1 --reload --port 8000

# Khoi chay tren docker
docker-compose --file docker-compose.yml up <nếu muốn có cache>
docker-compose --file docker-compose.nocache.yml up <nếu ko muốn có cache>
