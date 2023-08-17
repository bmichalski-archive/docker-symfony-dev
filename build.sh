#!/bin/bash

docker build "$@" -t bmichalski/nginx-php-fpm-dev ./nginx-php-fpm
docker build "$@" -t bmichalski/php-fpm-dev ./php-fpm 
