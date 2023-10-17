FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install vim -y
RUN apt-get install mariadb-server -y

COPY ./conf/createDb.sh ./etc/createDb.sh
RUN	chmod +x ./etc/createDb.sh

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT ["./etc/createDb.sh"]
