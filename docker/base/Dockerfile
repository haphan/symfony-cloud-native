FROM alpine:3.8

ENV S6VERSION 1.21.7.0
ENV TIMEZONE "Asia/Singapore"
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV SYMFONY_LOG "php://stderr"

# Copy configuration files to root
COPY root /

RUN apk add --update \
    wget \
    tzdata\
    tini \
    bash \
    ca-certificates \
    openssl \
    nginx \
    curl \
    php7-fpm \
    php7-intl \
    php7-openssl \
    php7-sqlite3 \
    php7-pdo_mysql \
    php7-pcntl \
    php7-xsl \
    php7-fpm \
    php7-pspell \
    php7-snmp \
    php7-mbstring \
    php7-xmlreader \
    php7-xmlwriter \
    php7-pdo_sqlite \
    php7-opcache \
    php7-ldap \
    php7-posix \
    php7-session \
    php7-gd \
    php7-gettext \
    php7-json \
    php7-xml \
    php7-iconv \
    php7-sysvshm \
    php7-curl \
    php7-shmop \
    php7-phar \
    php7-pdo_pgsql \
    php7-pgsql \
    php7-zip \
    php7-ctype \
    php7-mcrypt \
    php7-bcmath \
    php7-calendar \
    php7-tidy \
    php7-dom \
    php7-sockets \
    php7-soap \
    php7-zlib \
    php7-ftp \
    php7-sysvsem \
    php7-pdo \
    php7-bz2 \
    php7-mysqli \
    php7-simplexml \
    php7-tokenizer \
    && ln -sf /usr/sbin/php-fpm7 /usr/bin/php-fpm \
    && ln -sf /usr/bin/php7 /usr/bin/php \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/"${TIMEZONE}" /etc/localtime \
    && echo ${TIMEZONE} >  /etc/timezone \
    && echo 'TLS_CACERT /etc/ssl/certs/ca-certificates.crt' >> /etc/openldap/ldap.conf \
    && echo 'error_log = /proc/1/fd/2' > /etc/php7/conf.d/00_custom.ini \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version \
    && composer global require hirak/prestissimo

RUN wget -q https://github.com/just-containers/s6-overlay/releases/download/v${S6VERSION}/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz \
    && tar xfz /tmp/s6-overlay.tar.gz -C / \
    && rm -f /tmp/s6-overlay.tar.gz \
    && mkdir -p /run/nginx \
    && apk del wget \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && rm -r /var/www/localhost \
    && chown -Rf nginx:www-data /var/www/

# Set working directory
WORKDIR /srv

# Expose the ports for nginx
EXPOSE 80

ENTRYPOINT [ "/init" ]
