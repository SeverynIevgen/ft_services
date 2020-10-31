FROM alpine:3.12.0

ARG IP
ENV IP=$IP
RUN apk add --update --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache openssl vsftpd
EXPOSE 20 21 21000

COPY telegraf.conf /etc/telegraf/
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh ./
# RUN rm -f telegraf.conf start.sh

ENTRYPOINT ["/bin/sh", "start.sh"]
