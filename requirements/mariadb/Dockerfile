FROM debian:buster

RUN apt update
RUN apt -y upgrade
RUN apt-get install -y mariadb-server bash zsh git curl

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/mariadb.conf
COPY tool/entrypoint.sh /

ENTRYPOINT [ "bash", "entrypoint.sh" ]