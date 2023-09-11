Mô tả :
Build 2 servers via 2 ports 8000 and 8080 by fastapi using nginx ///using cache ///
<!-- # Launch on local: (window) -->
pip install -r requirements.txt
source test_fastapi/bin/activate
uvicorn main:app1 --reload --port 8000

<!-- # Launch on docker -->
docker-compose --file docker-compose.yml up ///cache///
docker-compose --file docker-compose.nocache.yml up /// not cache///
