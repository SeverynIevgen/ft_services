FROM alpine:3.12.0

RUN apk add --update --no-cache telegraf \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache influxdb supervisor
EXPOSE 8086

COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./
# RUN rm -f telegraf.conf start.sh

ENTRYPOINT ["/bin/sh", "start.sh"]
