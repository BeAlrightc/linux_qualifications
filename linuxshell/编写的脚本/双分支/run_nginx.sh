#!/bin/bash
cd nginx-1.14.0/
./configure \
--user=nginx \
--group=nginx \
--prefix=/data/server/nginx \
--with-stream \
--with-http_ssl_module \
--with-http_stub_status_module \
--without-http_autoindex_module \
--without-http_ssi_module
make
make install

if [[ -x /data/server/nginx/sbin/nginx ]];then
clear
echo -n "一键部署nginx已经完成！"
fi



