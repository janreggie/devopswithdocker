#!/usr/bin/env fish

# Cleanup
docker container prune -f
docker rmi nginx

echo "docker ps -a:"
docker ps -a
# Output:
# CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

echo ""

echo "docker images:"
docker images
# Output:
# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
