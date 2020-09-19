#!/usr/bin/env fish
set -l current_directory (dirname (status --current-filename))
cd $current_directory
docker-compose build  # build the image
docker-compose push   # push the image to Dockerhub
