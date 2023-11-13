FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install redis-server php7.4-redis -y
COPY ./conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379
