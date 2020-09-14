#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
docker build -t spring-example-project $current_directory
docker run -d -p 8080:8080 spring-example-project
sleep 10
curl -v localhost:8080
# Contents
#
#  <!DOCTYPE html>
#  <html xmlns="http://www.w3.org/1999/xhtml">
#      <head>
#          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">        <title>Spring</title>
#          <meta charset="UTF-8" />
#  
#      </head>
#      <body style="width: fit-content; padding-top: 3em; margin: auto;">
#          <form action="/press" method="post">
#              <button class="btn btn-info btn-outline-dark" type="submit">Press here</button>
#          </form>
#          <p style="width: fit-content; margin: auto;"></p>
#      </body>
#  </html>
#
# A button that, when clicked, goes to localhost:8080/press.
# /press is similar to localhost:8080 but with a "Success" message below.
