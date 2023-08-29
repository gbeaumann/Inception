FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl php7.3 php7.3-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY tool/entrypoint.sh /
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

CMD ["bash", "/entrypoint.sh"]