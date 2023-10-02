FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y
RUN apt-get install mariadb-server -y

COPY ./conf/createDb.sh ./etc/createDb.sh
# RUN ./etc/createDb.sh

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf
