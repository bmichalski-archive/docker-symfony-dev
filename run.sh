#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

PHP_FPM_EXISTS=`docker inspect --format="{{ .Id }}" php-fpm 2> /dev/null`

if ! [ -z "$PHP_FPM_EXISTS" ]
then
  docker kill php-fpm
  docker rm php-fpm
fi

docker run \
-p 9000:9000 \
-v $DIR/vhost:/var/vhost \
--name php-fpm \
-d \
bmichalski/php-fpm \
bash -c "/root/on-startup.sh"

NGINX_PHP_EXISTS=`docker inspect --format="{{ .Id }}" nginx-php 2> /dev/null`

if ! [ -z "$NGINX_PHP_EXISTS" ]
then
  docker kill nginx-php
  docker rm nginx-php
fi

docker run \
-p 80:80 \
-v $DIR/vhost:/var/vhost \
--link php-fpm:php-fpm \
--name nginx-php \
-d \
bmichalski/nginx-php \
bash -c "/root/on-startup.sh"
