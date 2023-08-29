Mô tả :
Dựng 2 server trả qua 2 port là 8000 và 8080 bằng fastapi sử dụng nginx <có sử dụng cache>

docker-compose --file docker-compose.yml up <nếu muốn có cache>
docker-compose --file docker-composenocache.yml up <nếu ko muốn có cache>