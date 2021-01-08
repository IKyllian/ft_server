FROM debian:10

#WORKDIR /srcs

RUN apt-get update
RUN apt-get install -y wget zsh git vim && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server
RUN apt-get install -y php php-common php-fpm php-mysql php-json php-mbstring php-cgi
RUN mkdir /var/www/html/phpmyadmin
#RUN apt-get install -y php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

COPY /srcs/config_nginx_php /etc/nginx/sites-enabled/default
COPY /srcs/info.php /var/www/html/info.php
COPY /srcs/config.inc.php /var/www/html/phpmyadmin/confi.inc.php
COPY /srcs/phpMyAdmin-5.0.4-all-languages.tar.gz /tmp

RUN tar xzf /tmp/phpMyAdmin-5.0.4-all-languages.tar.gz -C /var/www/html/phpmyadmin

EXPOSE 80

CMD service php7.3-fpm start && nginx -g 'daemon off;'