#!/usr/bin/env fish

# I had to do a dist-upgrade just in case if apt install curl may break something.
# In addition, implemented quietness using -qq and assume yes using -y
# to minimize user interaction.
docker run -it ubuntu sh -c 'apt -qq update;
  apt -qqy dist-upgrade;
  apt -qqy install curl;
  echo "Input website:";
  read website;
  echo "Searching..";
  sleep 1;
  curl http://$website;'

# Output when inputting `helsinki.fi` is as follows:
#
#   <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
#   <html><head>
#   <title>301 Moved Permanently</title>
#   </head><body>
#   <h1>Moved Permanently</h1>
#   <p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
#   </body></html>