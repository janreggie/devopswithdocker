#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
docker-compose up -d
sleep 1
curl localhost:8000
