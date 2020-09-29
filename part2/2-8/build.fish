#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
touch logs.txt
docker-compose up
