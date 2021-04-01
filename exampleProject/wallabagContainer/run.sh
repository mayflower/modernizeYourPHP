#!/bin/bash

if ! [ -e "/var/www/html/wallabag" ]; then
  echo "Copying project to shared volume, please wait..."
  cp -rL /app/wallabag /var/www/html/
  cp -f /var/www/html/wallabagContainer/wallabag.sqlite /var/www/html/wallabag/data/db/wallabag.sqlite
  echo "Project copied, FPM will start now!"
fi

php-fpm
