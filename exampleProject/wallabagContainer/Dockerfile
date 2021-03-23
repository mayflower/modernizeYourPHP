FROM php:5.6-fpm

# latest 1.* composer, 2.* causes issues
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer

# Default timezone. To change it, use the argument in the docker-compose.yml file
ARG timezone='Europe/Paris'

RUN apt-get update && apt-get install -y \
        libmcrypt-dev libicu-dev libpq-dev libxml2-dev git zip libgd3 libpng-dev \
    && docker-php-ext-install \
        iconv mcrypt mbstring intl pdo gd


ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
    echo "Changing IDs of www-data:www-data to ${USER_ID}:${GROUP_ID}" &&\
    usermod -u ${USER_ID} www-data &&\
    groupmod -g ${GROUP_ID} www-data &&\
    chown --changes --silent --no-dereference --recursive \
          ${USER_ID}:${GROUP_ID} /var/www/html \
;fi

RUN echo "date.timezone="$timezone > /usr/local/etc/php/conf.d/date_timezone.ini

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
