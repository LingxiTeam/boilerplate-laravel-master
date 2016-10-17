#!/usr/bin/env bash

rm -rf template

git clone https://github.com/laravel/laravel

mv laravel template

cd template

cp .env.example .env
cp .env.example .env.testing.example
cp run.sh init.sh

cp ../shipit.sh shipit.sh
cp ../after_shipit.sh after_shipit.sh
cp ../gitlab.ci.yml gitlab.ci.yml
cp ../composer.json composer.json

echo "test.php" >> .gitignore

rm -rf .git

touch test.php

echo "Complete!!!"

