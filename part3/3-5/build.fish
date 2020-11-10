#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
touch logs.txt
chmod 777 logs.txt # Important: allows you to set logs.txt to be written by anyone!
docker-compose build
docker-compose up

# Original sizes:
#   Container      Repository    Tag       Image Id       Size  
# --------------------------------------------------------------
# 3-4_backend_1    <none>       <none>   8e556253132d   214 MB  
# 3-4_frontend_1   <none>       <none>   9f0bc0329ea3   417.6 MB
#
# New sizes:
#   Container      Repository    Tag       Image Id       Size  
# --------------------------------------------------------------
# 3-5_backend_1    backend      latest   d4ff6d27546b   929.6 MB
# 3-5_frontend_1   frontend     latest   583f67e00457   1.133 GB
