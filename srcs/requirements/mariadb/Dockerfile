FROM debian:buster

RUN	apt-get update && apt-get -y install mariadb-server mariadb-client &&\
						mkdir -p /var/run/mysqld ; mkdir -p /run/mysqld &&\
						chown -R mysql:root /var/run/mysqld/ ; chown -R mysql:root /run/mysqld/

COPY ./tools/db_script.sh /root/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD [ "bash", "/root/db_script.sh" ]
