#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
docker build -t backend-example-docker $current_directory
touch $current_directory/logs.txt
set -l container_id (docker run -d -p 8000:8000 -v (pwd)/$current_directory/logs.txt:/root/backend-example-docker/logs.txt backend-example-docker)
echo "Ran container with ID "$container_id". Waiting for 60 seconds then start curling"
sleep 60  # give it a minute to wait
curl -v localhost:8000