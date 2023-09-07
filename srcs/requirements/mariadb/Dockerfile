FROM debian:buster

RUN apt update
RUN apt -y upgrade
RUN apt-get install -y mariadb-server mariadb-client bash zsh git curl procps

RUN mkdir data && mkdir -p /run/mysqld/ \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY conf/mariadb.conf /etc/mysql/my.cnf
COPY conf/init.sql /init.sql

ARG DB_NAME
ARG DB_PASSWORD
ARG DB_USER
ARG DB_ROOT_PWD

RUN sed -i "s/db/${DB_NAME}/g" /init.sql
RUN sed -i "s/root_pwd/${DB_ROOT_PWD}/g" /init.sql
RUN sed -i "s/pwd/${DB_PASSWORD}/g" /init.sql
RUN sed -i "s/user/${DB_USER}/g" /init.sql

ENTRYPOINT ["mysqld", "-u", "mysql", "--init-file", "/init.sql"]