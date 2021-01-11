#!/bin/bash

service mysql restart
service php7.3-fpm start
if [ "$AUTOINDEX" = "off" ]
then
	mv /tmp/config_nginx_off.conf /etc/nginx/sites-enabled/default
else
	mv /tmp/config_nginx.conf /etc/nginx/sites-enabled/default
fi
nginx -g 'daemon off;' 