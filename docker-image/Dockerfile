FROM alpine:3.5

MAINTAINER Viacheslav Pryimak <pbotanik@gmail.com>

RUN echo  "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && apk add bash apache2 libxml2-dev apache2-utils mysql mysql-client supervisor redis  php7 curl ssmtp php7 php7-phar php7-curl \
    php7-json php7-zlib php7-xml php7-dom php7-ctype php7-opcache php7-zip php7-iconv \
    php7-pdo php7-pdo_mysql php7-pdo_sqlite php7-pdo_pgsql php7-mbstring php7-session \
    php7-mcrypt php7-sockets && \
    rm -rf /var/cache/apk/* &&  ln -s /usr/bin/php7 /usr/bin/php 


RUN mkdir -p /data/mysql /data/apache2/ /data/www/
RUN rm -rf /etc/apache2
RUN ln -s  /data/apache2 /etc/apache2
# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#RUN mysql_install_db --user=mysql --data=/var/lib/mysql
ADD config/run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh


VOLUME /data
EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
