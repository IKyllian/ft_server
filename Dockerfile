FROM debian:10

WORKDIR /

COPY /srcs /srcs

RUN apt-get update \
	&& apt-get install -y nginx \
	&& mkdir /etc/nginx/ssl \
	&& mv /srcs/html.csr /etc/nginx/ssl/ \
 	&& mv /srcs/html.key /etc/nginx/ssl/ \
 	&& mv /srcs/html.pem /etc/nginx/ssl/ \
	&& apt-get install -y wget zsh git vim && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" \
	&& apt-get install -y expect mariadb-server mariadb-client \
	&& apt-get install -y php php-common php-fpm php-mysql php-json php-mbstring php-cgi php-zip php-gd php-xml php-pear php-gettext \
	&& service mysql restart \
	&& mv /srcs/config_mariadb.sh /var/www/html \
	&& sh /var/www/html/config_mariadb.sh \
	&& mv /srcs/start_config.sh /var/www/html \
	&& mv /srcs/info.php /var/www/html/info.php \
	&& tar xzf /srcs/phpMyAdmin-5.0.4-all-languages.tar.gz -C /var/www/html && mv /var/www/html/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin \
	&& tar xzf /srcs/wordpress-5.6.tar.gz -C /var/www/html \
	&& mv /srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php \
	&& mv /srcs/wp-config.php var/www/html/wordpress \
	&& mv /srcs/config_user_db.sql var/www/html/phpmyadmin \
	&& chown -R www-data:www-data /var/www/html/phpmyadmin && chown -R www-data:www-data /var/www/html/wordpress/ \
	&& mysql -u root < var/www/html/phpmyadmin/config_user_db.sql \
	&& mysql -u root < var/www/html/phpmyadmin/sql/create_tables.sql

EXPOSE 80 443

CMD sh /var/www/html/start_config.sh