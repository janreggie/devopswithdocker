#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
touch logs.txt
docker-compose up

# Changes made:
# - Use API_URL on frontend to localhost:8080/api
