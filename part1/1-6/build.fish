#!/usr/bin/env fish
# Command to build the dockerfile
set -l current_directory (dirname (status --current-filename))
docker build -t docker-clock $current_directory && docker run -d docker-clock
# Clock can be seen via `docker logs -t -f CONTAINER_NAME`
# where CONTAINER_NAME has to be set manually