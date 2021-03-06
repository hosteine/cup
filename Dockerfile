FROM alpine:3.5

MAINTAINER Oleksii Antypov <echo@wivern.co.uk>
MAINTAINER Viacheslav Pryimak <pbotanik@gmail.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk add \
      bash \
      git \
      mc \
      curl \
      ssmtp \
      redis \
      mysql \
      mysql-client \
      apache2 \
      libxml2-dev \
      apache2-utils \
      php7-apache2 \
      php7 \
      php7-bcmath \
      php7-phar \
      php7-curl \
      php7-json \
      php7-zlib \
      php7-xml \
      php7-dom \
      php7-ctype \
      php7-opcache \
      php7-zip \
      php7-iconv \
      php7-pdo \
      php7-pdo_mysql \
      php7-mysqli \
      php7-mbstring \
      php7-session \
      php7-mcrypt \
      php7-sockets \
      php7-redis \
      composer \
      supervisor \
      && \
    rm -rf /var/cache/apk/*

COPY bin /hosteine/bin
COPY data /data
COPY config /config

RUN chown -R mysql:mysql /data/mysql && \
    rm -rf /var/lib/mysql /etc/mysql/my.cnf && \
    ln -s /data/mysql /var/lib/ \
    ln -s /config/mysql/my.cnf /etc/mysql/

RUN rm -rf /etc/apache2 && \
    ln -s /config/apache2 /etc/

RUN rm -rf /etc/redis.conf && \
    ln -s /config/redis/redis.conf /etc/

RUN ln -s /config/php/php.ini /etc/php7/conf.d/

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir /run/apache2

RUN chmod +x /hosteine/bin/*

VOLUME /data

EXPOSE 80 22

CMD ["/hosteine/bin/boot"]
