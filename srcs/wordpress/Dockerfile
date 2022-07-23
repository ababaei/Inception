FROM debian:buster

RUN	apt-get update && apt-get -y install \
	php7.3-common php7.3-fpm php7.3-mysql \
	curl \
	mariadb-client

RUN mkdir -p /var/www/html
RUN chmod -R 766 /var/www/html

RUN mkdir -p /run/php
RUN chmod -R 766 /run/php

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY init.sh /root/init.sh

EXPOSE 9000

CMD [ "bash", "/root/init.sh" ]
