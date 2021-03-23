#!/bin/bash

if ! [ -e "/var/www/html/wallabag" ]; then
  cd /var/www/html && SYMFONY_ENV=prod composer create-project wallabag/wallabag wallabag "2.0.0-beta.1" --no-dev
  cp -f /var/www/html/wallabagContainer/wallabag.sqlite /var/www/html/wallabag/data/db/wallabag.sqlite
fi

php-fpm
