FROM alpine:3.12.0

RUN apk add --update --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache mariadb mariadb-client
VOLUME ["/var/lib/mysql"]
EXPOSE 3306

COPY my.cnf /etc/mysql/
COPY telegraf.conf /etc/telegraf/
COPY start.sh ./
COPY wordpress_db.sql ./

ENTRYPOINT ["/bin/sh", "start.sh"]
