FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y php7.4-mysql \
						php-fpm \
						php-mysqli \
						curl
RUN	curl -sSL https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /etc/adminer.php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
