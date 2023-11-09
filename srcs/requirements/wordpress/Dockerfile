FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y

RUN apt-get -y install wget

RUN apt-get install -y php7.4 \
						php-fpm \
						php-mysql \
						mariadb-client
RUN mkdir -p /var/www
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz
RUN rm /var/www/wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/config_wp.sh /usr/local/bin/config_wp.sh
RUN chmod 755 /usr/local/bin/config_wp.sh

ENTRYPOINT ["sh", "/usr/local/bin/config_wp.sh"]
