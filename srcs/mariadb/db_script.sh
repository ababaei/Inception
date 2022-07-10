if [ ! -f /var/lib/mysql/conf_done ]
then
	myslqd
	
	mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE"

	mysql -u root -e "CREATE USER '$MYSQL_USER'@'$MYSQL_HOSTNAME' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -u root -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"

	mysql -u root -e "CREATE USER '$MYSQL_ROOT'@'$MYSQL_HOSTNAME' IDENTIFIED BY '$MYSQL_iROOT_PASSWORD';"
	mysql -u root -e "GRANT ALL ON *.* TO '$MYSQL_USER'@'%';"

	mysql -u root -e "FLUSH PRIVILEGES;"
	touch /var/lib/mysql/conf_done
fi

myslqd
