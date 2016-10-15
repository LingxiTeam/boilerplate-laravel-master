#!/bin/bash

function assert_ok()
{
    if [ "$1" != 0 ]; then
        exit 1
    fi
}

function command_exists () {
    type "$1" &> /dev/null ;
}

composer install -o --no-dev || assert_ok $?

php artisan key:generate || assert_ok $?
php artisan env || assert_ok $?

mkdir storage/logs/schedule

chmod 766 -R storage || assert_ok $?
chmod 766 bootstrap/cache || assert_ok $?

php artisan optimize || assert_ok $?

exit 0

