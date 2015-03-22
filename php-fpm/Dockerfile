FROM bmichalski/php-fpm

RUN \
  base/configure.sh

RUN \
  apt-get install -y \
    php5-xdebug

COPY conf/etc/php5 /etc/php5

CMD \
  /root/on-startup.sh
