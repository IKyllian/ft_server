FROM debian:10

#WORKDIR /srcs

COPY /srcs/html.csr /etc/nginx/ssl/
COPY /srcs/html.key /etc/nginx/ssl/
COPY /srcs/html.pem /etc/nginx/ssl/

#install zsh, nginx and mariadb (mysql)
RUN apt-get update \
	&& apt-get install -y wget zsh git vim && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" \
	&& apt-get install -y expect nginx mariadb-server mariadb-client 

COPY srcs/config_mariadb.sh /var/www/html

#exec script sh for mysql_secure_installation and install php
RUN service mysql restart \
	&& sh /var/www/html/config_mariadb.sh \
	&& apt-get install -y php php-common php-fpm php-mysql php-json php-mbstring php-cgi php-zip php-gd php-xml php-pear php-gettext

#copy nginx config, info.php and download.tar (phpmyadmin, wordrpress)
COPY /srcs/config_nginx.conf /etc/nginx/sites-enabled/default
COPY /srcs/info.php /var/www/html/info.php
COPY /srcs/phpMyAdmin-5.0.4-all-languages.tar.gz /tmp
COPY /srcs/wordpress-5.6.tar.gz /tmp

#dezip phpmyadmin and wordpress 
RUN tar xzf /tmp/phpMyAdmin-5.0.4-all-languages.tar.gz -C /var/www/html && mv /var/www/html/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin \
	&& tar xzf /tmp/wordpress-5.6.tar.gz -C /var/www/html

#copy all config for phpmyadmin, wordpress
COPY /srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY /srcs/wp-config.php var/www/html/wordpress
COPY /srcs/config_user_db.sql var/www/html/phpmyadmin

#Set ownership for phpmyadmin and wordpress folders
RUN chown -R www-data:www-data /var/www/html/phpmyadmin && chown -R www-data:www-data /var/www/html/wordpress/ \
	&& service mysql restart && mysql -u root < var/www/html/phpmyadmin/config_user_db.sql

EXPOSE 80 443

CMD service mysql restart && service php7.3-fpm start && nginx -g 'daemon off;'