#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
docker-compose up -d
sleep 2
set -l address (docker-compose port ports 80)
printf "Contents of %s:\n" $address
curl $address # prints out "Ports configured correctly!!"
echo ""  # prints out newline since curl won't
docker-compose rm -fs ports
