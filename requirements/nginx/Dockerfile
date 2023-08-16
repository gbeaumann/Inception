FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install nginx openssl

RUN mkdir ./etc/nginx/ssl
RUN openssl req -x509 -new -newkey rsa:2048 -nodes \
	-keyout /etc/nginx/ssl/gbeauman.key -days 365 \
	-out /etc/nginx/ssl/gbeauman.crt \
	-subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=gbeauman/CN=gbeauman/"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
#COPY ./index.html /var/www/html

RUN mkdir -p /var/run/nginx

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
