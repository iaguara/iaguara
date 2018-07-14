FROM php:fpm-alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara PHP FPM"

RUN \
  docker-php-ext-install \
    mbstring \
    mysqli

CMD ["php-fpm"]
