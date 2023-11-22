FROM debian:bullseye

#upgrade and installation of requirements
RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get install nginx -y

#openSSL
RUN mkdir /etc/nginx/ssl -p
RUN apt install openssl -y
#Creates the certificates and key
RUN openssl req -x509 -nodes -out \
	/etc/nginx/ssl/inception.crt -keyout \
	/etc/nginx/ssl/inception.key -subj \
	"/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# #Config of nginx
RUN mkdir /var/run/nginx -p
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD	[ "nginx", "-g", "daemon off;" ]
