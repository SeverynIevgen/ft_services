FROM alpine:3.12.0

RUN apk add --update --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache mariadb mariadb-client mysql-client
EXPOSE 3306

#COPY my.cnf /etc/
#RUN chmod o-rwx /etc/my.cnf
COPY telegraf.conf /etc/telegraf/
COPY start.sh ./
COPY db_init.sh ./
RUN chmod +x db_init.sh
COPY wordpress.sql ./

ENTRYPOINT ["/bin/sh", "start.sh"]