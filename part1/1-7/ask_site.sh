#!/bin/bash
echo "Input website"
read -r website  # -r to not strip backslashes
echo "Searcing..."
sleep 1
curl http://$website