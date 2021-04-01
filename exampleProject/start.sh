#!/bin/bash

# this is only relevant for Unix hosts
export USER_ID=$(id -u ${USER})
export GROUP_ID=$(id -g ${USER})

docker-compose up $@
