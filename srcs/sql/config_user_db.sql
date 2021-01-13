CREATE DATABASE phpmyadmin;
CREATE DATABASE wordpress;

GRANT ALL ON *.* TO 'pikachu'@'localhost' IDENTIFIED BY 'pikachu';

FLUSH PRIVILEGES;