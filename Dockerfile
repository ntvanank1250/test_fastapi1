

FROM python:3.9

ENV MORE_HEADERS_VERSION=0.33
ENV MORE_HEADERS_GITREPO=openresty/headers-more-nginx-module

WORKDIR /var/www/test_fastapi1
COPY . ./

RUN apt-get update\
    && chmod +x /var/www/test_fastapi1/main.py \
    && pip install supervisor\
    && pip install -U pip \
    &&  pip install -r requirements.txt    
# Tải module "ngx_http_headers_more_module"
RUN wget https://github.com/openresty/headers-more-nginx-module/archive/v0.33.tar.gz && \
    tar -xzvf v0.33.tar.gz
