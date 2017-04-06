FROM alpine:3.5

MAINTAINER Oleksii Antypov <echo@wivern.co.uk>
MAINTAINER Viacheslav Pryimak <pbotanik@gmail.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk add \
      bash \
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
      supervisor \
      && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    rm -rf /var/cache/apk/*

COPY data /data

RUN chown -R mysql:mysql /data/mysql && \
    rm -rf /var/lib/mysql && \
    ln -s /data/mysql /var/lib/

RUN rm -rf /etc/apache2 && \
    ln -s /data/apache2 /etc/

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME /data

EXPOSE 80 22

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
