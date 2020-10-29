#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
touch logs.txt
chmod 777 logs.txt # Important: allows you to set logs.txt to be written by anyone!
docker-compose build
docker-compose up
