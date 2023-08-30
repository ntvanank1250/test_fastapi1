# FROM python:3.9



# WORKDIR /var/www/test_fastapi1
# COPY . ./

# RUN apt-get update\
#     && chmod +x /var/www/test_fastapi1/main.py \
#     && pip install supervisor\
#     && pip install -U pip \
#     &&  pip install -r requirements.txt\
#     && apt-get install -y nginx-extras    
FROM python:3.9

# Cài đặt Nginx và module ngx_http_headers_more_filter_module
RUN apt-get update \
    && apt-get install -y nginx-extras

# Cấu hình Nginx và module
COPY nginx.conf /etc/nginx/nginx.conf

# Cài đặt các gói Python
WORKDIR /var/www/test_fastapi1
COPY requirements.txt ./
RUN pip install -U pip \
    && pip install -r requirements.txt

# Copy mã nguồn ứng dụng
COPY . .

# Chỉnh sửa quyền thực thi của tệp main.py
RUN chmod +x main.py

# Khởi động Nginx và ứng dụng FastAPI
CMD ["supervisord", "-c", "/var/www/test_fastapi1/supervisord.conf"]