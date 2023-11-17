FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

RUN mkdir -p /var/www/html

RUN apt-get install -y php7.4-mysql \
						php-mysql \
						php-fpm \
						curl
RUN	curl -sSL https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/index.php

RUN	usermod -u 82 www-data
RUN usermod -a -G www-data www-data

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php/

EXPOSE 9000
STOPSIGNAL SIGQUIT


ENTRYPOINT ["php-fpm7.4", "--nodaemonize"]
