# ft_server
# Résumé :
Ce document est un sujet d’Administration Système. Il vous fera découvrir
Docker et vous fera mettre en place un server web.  
 
Ce sujet à pour but de vous faire découvir découvrir l’administration système en vous
sensibilisant a l’importance de l’utilisation de scripts pour automatiser vos taches. Pour ce
faire, nous allons vous faire découvrir la technologie "Docker" afin de vous faire installer
un server web complet, qui sera capable de faire tourner plusieurs services, tel qu’un
Wordpress, Phpmyadmin, ainsi qu’une base de donnée.
# Partie Obligatoire
- Vous devrez, dans un seul container Docker, mettre en place un serveur web avec
Nginx. Le container devra tourner avec Debian Buster.
- Votre serveur devra être capable de faire tourner plusieurs services en même temps.
Les services seront un Wordpress à installer par vous même, ainsi que Phpmyadmin
et MySQL. Vous devrez vous assurer que votre base de donnée SQL fonctionne
avec le wordpress et phpmyadmin.
- Votre serveur devra pouvoir, quand c’est possible, utiliser le protocole SSL.
- Vous devrez vous assurer que, selon l’url tapé, votre server redirige vers le bon
site.
- Vous devrez aussi vous assurer que votre serveur tourne avec un index automatique
qui doit pouvoir être désactivable.
