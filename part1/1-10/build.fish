#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
docker build -t frontend-example-docker $current_directory
set -l container_id (docker run -d -p 5000:5000 frontend-example-docker)
echo "Ran container with ID "$container_id". Waiting for 60 seconds then start curling"
sleep 60  # give it a minute to wait
curl -v localhost:5000
# Contents:
#
# <!DOCTYPE html>
# <html lang="en">
#   <head>
#     <meta charset="utf-8">
#     <meta content="ie=edge" http-equiv="x-ua-compatible">
#     <title>Webpack App</title>
#     <link href="vendors~main-1.css" rel="stylesheet" />
#     <link href="main.css" rel="stylesheet" />
#   </head>
#   <body>
#     <div id="root">
#     </div>
#     <script src="vendors~main.js" type="text/javascript"></script>
#     <script src="main.js" type="text/javascript"></script>
#   </body>
# </html>
