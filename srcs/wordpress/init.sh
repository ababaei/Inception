#!/bin/bash

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already installed"
else	
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	if [[ ! -d /var/www/html ]];
	then
		mkdir /var/www/html
	fi
	cd /var/www/html

	wp --allow-root core download

	wp --allow-root config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --dbcharset="utf8" --dbcollate="utf8_general_ci"
	wp --allow-root core install --url=ababaei.42.fr/wordpress --title=ababaei --admin_user=$WP_ADMIN --admin_password=$WP_ADPASS --admin_email=$WP_MAIL --skip-email
	wp --allow-root user create $WP_USER $WP_USERMAIL --role=author --user_pass=$WP_USERPASS
	wp --allow-root theme install twentyseventeen --activate
fi
