#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
sudo docker-compose up --scale compute=10
