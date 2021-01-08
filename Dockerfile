FROM debian:10

#WORKDIR /srcs

RUN apt-get update
RUN apt-get install -y wget zsh git vim && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install -y php php-common php-fpm php-mysql php-json php-mbstring php-cgi php-zip php-gd php-xml php-pear php-gettext

COPY /srcs/config_nginx_php /etc/nginx/sites-enabled/default
COPY /srcs/info.php /var/www/html/info.php
COPY /srcs/phpMyAdmin-5.0.4-all-languages.tar.gz /tmp

RUN tar xzf /tmp/phpMyAdmin-5.0.4-all-languages.tar.gz -C /var/www/html && mv /var/www/html/phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin

COPY /srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
COPY /srcs/config_phpmyadmin.sql var/www/html/phpmyadmin

RUN chown -R www-data:www-data /var/www/html/phpmyadmin
RUN mysql -u root < var/www/html/phpmyadmin/config_phpmyadmin.sql

EXPOSE 80

CMD service mysql restart && service php7.3-fpm start && nginx -g 'daemon off;'