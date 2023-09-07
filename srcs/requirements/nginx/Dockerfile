FROM debian:buster

RUN apt update -y
RUN apt install nginx vim zsh curl -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=gbeauman/CN=gbeauman/"

RUN mkdir -p /var/run/nginx

COPY conf/default.conf /etc/nginx/conf.d/
COPY conf/nginx.conf /etc/nginx/nginx.conf


RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]

