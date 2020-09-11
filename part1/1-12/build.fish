#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
docker build -t frontend-example-docker -f $current_directory/frontend.Dockerfile $current_directory
docker build -t backend-example-docker -f $current_directory/backend.Dockerfile $current_directory
touch $current_directory/logs.txt
set -l frontend_container (docker run -d -p 5000:5000 frontend-example-docker)
set -l backend_container (docker run -d -p 8000:8000 -v (pwd)/$current_directory/logs.txt:/root/backend-example-docker/logs.txt backend-example-docker)
echo "Ran containers: frontend: "$frontend_container", backend: "$backend_container"."

# Wait for 60 minutes and then go to localhost:5000 and click the `Press to Test!` button
# to verify that it is working
