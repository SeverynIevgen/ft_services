FROM alpine:3.12.0

ARG IP
ENV IP=$IP
RUN apk add --update --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache nginx openssh openssl supervisor

COPY nginx.conf /etc/nginx/
COPY ssl_params.conf /etc/nginx/
COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/supervisord.conf
COPY start.sh ./
# RUN rm -f nginx.conf ssl_params.conf telegraf.conf start.sh

ENTRYPOINT ["/bin/sh", "start.sh"]

EXPOSE 80 443 22
