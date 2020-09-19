#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
touch logs.txt
docker-compose build
docker-compose up
# Going to localhost:5000 will bring up the buttons and stuff
