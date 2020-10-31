FROM alpine:3.12.0

RUN apk add --update --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#RUN apk add --update --no-cache mariadb supervisor
RUN apk add --update --no-cache mysql mysql-client supervisor
VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

COPY my.cnf /etc/
RUN chmod o-rwx /etc/my.cnf
COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./
COPY wordpress_db.sql ./
COPY init_db.sql ./

ENTRYPOINT ["/bin/sh", "start.sh"]
