#!/bin/bash

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already installed"
else	
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	if ![ -d /var/www/html]
	then
		mkdir /var/www/html
	cd /var/www/html

	wp core download # Download wordpress (gaffe à être dans le bon dossier les enfants)
	wp config create --dbname=<db_name> --dbuser=<db_user> --dbpass=<db_pass> --dbhost=<mariadb_host> --dbcharset="utf8" --dbcollate="utf8_general_ci" # Configure la DB
	wp core install --url=<login.42.fr>/wordpress --title=<titre_site> --admin_user=<admin_username> --admin_password=<admin_pass> --admin_email=<admin_mail> --skip-email #Configure le site et l'admin
	wp user create <wp_user> <wp_mail> --role=author --user_pass=<wp_user_pass>
	wp theme install <theme_name> --activate
fi

exec "$@"
