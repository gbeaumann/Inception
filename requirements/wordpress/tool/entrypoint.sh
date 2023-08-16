#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$MARIADB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MARIADB_PWD/g" wp-config-sample.php
	sed -i "s/localhost/$WP_ADMIN_PWD/g" wp-config-sample.php
	sed -i "s/database_name_here/$MARIADB_DB/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

fi

php-fpm7.3 --nodaemonize