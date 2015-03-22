FROM bmichalski/php-fpm

RUN \
  base/configure.sh

RUN \
  apt-get install -y \
    php5-xdebug \
    php5-curl \
    php5-intl \
    curl \
    git 
    

RUN \
  curl -sS https://getcomposer.org/installer | php && \
  mv /root/composer.phar /usr/bin/composer

COPY conf/etc/php5 /etc/php5

CMD \
  /root/on-startup.sh
