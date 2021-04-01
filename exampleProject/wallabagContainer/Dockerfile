FROM php:5.6-fpm

# latest 1.* composer, 2.* causes issues
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer

ENV COMPOSER_MEMORY_LIMIT=-1
ENV SYMFONY_ENV=prod

# Default timezone. To change it, use the argument in the docker-compose.yml file
ARG timezone='Europe/Paris'
RUN echo "date.timezone="$timezone > /usr/local/etc/php/conf.d/date_timezone.ini

RUN apt-get update && apt-get install -y \
        libmcrypt-dev libicu-dev libpq-dev libxml2-dev git zip libgd3 libpng-dev \
    && docker-php-ext-install \
        iconv mcrypt mbstring intl pdo gd

COPY run.sh /run.sh
RUN chmod +x /run.sh

ARG USER_ID
ARG GROUP_ID

RUN mkdir /app && chown $USER_ID:$GROUP_ID /app
RUN mkdir /.composer && chown $USER_ID:$GROUP_ID /.composer

RUN chown $USER_ID:$GROUP_ID /app

USER $USER_ID:$GROUP_ID

RUN cd /app && composer create-project wallabag/wallabag wallabag "2.0.0-beta.1" --no-dev

CMD ["/run.sh"]
