FROM debian:bullseye

RUN apt-get update
RUN apt-get install vsftpd -y

RUN mkdir -p /var/www/html
RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./conf/init_ftp.sh /usr/local/bin/init_ftp.sh

RUN chmod 777 /usr/local/bin/init_ftp.sh

STOPSIGNAL SIGKILL

ENTRYPOINT ["sh", "/usr/local/bin/init_ftp.sh"]
