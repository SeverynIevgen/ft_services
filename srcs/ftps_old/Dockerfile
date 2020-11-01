FROM alpine:3.12.0

ARG IP
ENV IP=$IP
#RUN apk add --update --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache openssl supervisor
EXPOSE 20 21 21000

COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./

ENTRYPOINT ["/bin/sh", "start.sh"]
