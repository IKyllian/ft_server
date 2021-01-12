#!/bin/bash

service mysql restart
service php7.3-fpm start
if [ "$AUTOINDEX" = "off" ]
then
	mv /srcs/config_nginx_off.conf /etc/nginx/sites-enabled/default
else
	mv /srcs/config_nginx.conf /etc/nginx/sites-enabled/default
fi
nginx -g 'daemon off;' 