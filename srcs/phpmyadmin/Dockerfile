FROM alpine:3.12.0

#RUN apk add --update --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update --no-cache php7 php7-fpm php7-mysqli php7-mbstring php7-gd \
    php7-opcache php7-zlib php7-curl php7-json php7-session wget supervisor nginx
EXPOSE 5000

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_static_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.16.1_static_linux_amd64.tar.gz && rm -rf telegraf-1.16.1_static_linux_amd64.tar.gz
RUN mv telegraf-1.16.1/etc/telegraf etc/telegraf
RUN mv telegraf-1.16.1/etc/logrotate.d /etc/logrotate.d
RUN mv telegraf-1.16.1/usr/bin/telegraf usr/bin/telegraf
RUN chmod +x usr/bin/telegraf
RUN mv telegraf-1.16.1/usr/lib/telegraf usr/lib/telegraf
RUN chmod +x usr/lib/telegraf/scripts/init.sh
RUN chmod +x usr/lib/telegraf/scripts/telegraf.service
RUN mv telegraf-1.16.1/var/log/telegraf var/log/telegraf

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz \
 && tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz \
 && mkdir -p /var/www && mv phpMyAdmin-5.0.2-all-languages /var/www/phpmyadmin \
 && rm phpMyAdmin-5.0.2-all-languages.tar.gz
 
COPY config.inc.php /var/www/phpmyadmin/
COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY start.sh ./

ENTRYPOINT ["/bin/sh", "start.sh"]
