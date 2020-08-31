#!/usr/bin/env fish

# Start three running
set -l nginx_1 (docker run -d nginx)
set -l nginx_2 (docker run -d nginx)
set -l nginx_3 (docker run -d nginx)
echo "Started three containers"

# Stop two
docker stop $nginx_2 $nginx_3
echo "Stopped two"

# Print out ps
echo "docker ps -a:"
docker ps -a
# Output:
# (columns artificially shortened; content is the same)
#
# CONTAINER ID   IMAGE     COMMAND                  CREATED           STATUS                     PORTS    NAMES
# cc9bbcf01df6   nginx     "/docker-entrypoint.…"   6 seconds ago     Exited (0) 2 seconds ago            happy_lichterman
# 69f528c8a182   nginx     "/docker-entrypoint.…"   9 seconds ago     Exited (0) 2 seconds ago            quizzical_germain
# ed26d0347a2f   nginx     "/docker-entrypoint.…"   12 seconds ago    Up 9 seconds               80/tcp   recursing_meninsky
