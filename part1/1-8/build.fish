#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
# Get devopsdockeruh/first_volume_exercise and then start bind mount
touch $current_directory/logs.txt  # create it first
set -l container_id (docker run --rm -d -v (pwd)/$current_directory/logs.txt:/usr/app/logs.txt devopsdockeruh/first_volume_exercise)
echo "Please kill "$container_id" once you're done. Thanks!"
tail -f $current_directory/logs.txt
# See logs.txt for what the message is
