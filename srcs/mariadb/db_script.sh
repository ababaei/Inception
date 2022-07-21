#!/bin/bash

if [ ! -f /var/lib/mysql/conf_done ]
then
	mysqld
	
	mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE}"

	mysql -u root -e "CREATE USER '${MYSQL_USER}'@'${MYSQL_HOSTNAME}' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -u root -e "GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"

	mysql -u root -e "CREATE USER '${MYSQL_ROOT}'@'${MYSQL_HOSTNAME}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	mysql -u root -e "GRANT ALL ON *.* TO '${MYSQL_USER}'@'%';"

	mysql -u root -e "FLUSH PRIVILEGES;"
	touch /var/lib/mysql/conf_done

	killall mysqld
fi

mysqld
