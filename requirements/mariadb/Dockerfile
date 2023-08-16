FROM debian:buster

RUN apt update
RUN apt -y upgrade
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

#COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/mariadb.conf
COPY conf/create_db.sql /usr/local/bin/
COPY tool/entrypoint.sh /usr/local/bin/

RUN	chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/create_db.sql

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]