#! /bin/ash


apk --update add openssl-dev pcre-dev zlib-dev wget build-base
cd /tmp/ && \
wget http://nginx.org/download/nginx-1.17.1.tar.gz && \
tar -zxvf nginx-1.17.1.tar.gz 
cd /tmp/nginx-1.17.1 && \
./configure \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --prefix=/etc/nginx \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --sbin-path=/usr/local/sbin/nginx && \
make && \
make install
apk del build-base
rm -rf /tmp/nginx-1.17.1
rm -rf /var/cache/apk/*
