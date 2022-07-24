FROM debian:buster

RUN	apt-get update && apt-get -y install nginx openssl

RUN mkdir /etc/nginx/ssl_cert
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout /etc/nginx/ssl_cert/localhost.key -out /etc/nginx/ssl_cert/localhost.crt -subj "/C=FR"

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#RUN nginx -t #let you know if your config file is ok

CMD ["nginx", "-g", "daemon off;"]
