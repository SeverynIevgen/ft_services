FROM alpine:3.12.0

RUN apk add --update --no-cache grafana telegraf \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache supervisor
EXPOSE 3000

WORKDIR /usr/share/grafana

COPY grafana.db /usr/share/grafana/data/
COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./

ENTRYPOINT ["/bin/sh", "./start.sh"]
