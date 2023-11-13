FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install redis-server php7.4-redis -y
COPY ./conf/redis.conf /etc/redis/redis.conf
COPY ./conf/entrypoint.sh /etc/entrypoint.sh
RUN	chmod +x /etc/entrypoint.sh

EXPOSE 6379

ENTRYPOINT ["sh", "/etc/entrypoint.sh"]