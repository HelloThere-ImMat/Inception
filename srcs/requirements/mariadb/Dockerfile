FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install mariadb-server -y

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

COPY ./conf/createDb.sh ./etc/createDb.sh
RUN	chmod +x ./etc/createDb.sh

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["sh", "/etc/createDb.sh"]
