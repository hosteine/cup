FROM alpine:3.5

MAINTAINER Viacheslav Pryimak <pbotanik@gmail.com>

RUN echo  "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && apk add bash mysql mysql-client nginx supervisor redis  php7 curl ssmtp php7 php7-phar php7-curl \
    php7-fpm php7-json php7-zlib php7-xml php7-dom php7-ctype php7-opcache php7-zip php7-iconv \
    php7-pdo php7-pdo_mysql php7-pdo_sqlite php7-pdo_pgsql php7-mbstring php7-session \
    php7-mcrypt php7-sockets && \
    rm -rf /var/cache/apk/* &&  ln -s /usr/bin/php7 /usr/bin/php 

# Configure nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# Configure PHP-FPM
COPY config/fpm-pool.conf /etc/php7/php-fpm.d/hostein_custom.conf
COPY config/php.ini /etc/php7/conf.d/hostein_custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN rm -rf /etc/nginx/conf.d/default.conf
RUN mysql_install_db --user=mysql --data=/var/lib/mysql
ADD config/run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh


# Add application
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY src/ /var/www/html/

EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
