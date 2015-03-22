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

NGINX_PHP_FPM_EXISTS=`docker inspect --format="{{ .Id }}" nginx-php-fpm 2> /dev/null`

if ! [ -z "$NGINX_PHP_FPM_EXISTS" ]
then
  docker kill nginx-php-fpm
  docker rm nginx-php-fpm
fi

docker run \
-p 80:80 \
-v $DIR/vhost:/var/vhost \
--link php-fpm:php-fpm \
--name nginx-php-fpm \
-d \
bmichalski/nginx-php-fpm \
bash -c "/root/on-startup.sh"
