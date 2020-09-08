#!/usr/bin/env fish

set -l container_id (docker run -d -p 80 devopsdockeruh/ports_exercise)
# docker port $container_id is of the form "80/tcp -> ip_addr:port", and we want "ip_addr:port"
set -l exposed_addr (docker port $container_id | string split ' ')
set -l exposed_addr $exposed_addr[3]
echo "Ran container in "$container_id" and exposed to "$exposed_addr"."

# Apologies for the expletive but fuck me.
# I've spent 30 minutes trying to figure out why it puts out an error 52.
# It just needs a bit of time to set up.
sleep 2
curl -v "$exposed_addr"  # Prints out "Ports configured correctly!!"
echo ""  # response doesn't have a newline

docker rm -f $container_id # Cleanup