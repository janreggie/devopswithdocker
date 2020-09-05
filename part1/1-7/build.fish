#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
docker build -t curler $current_directory && docker run -it curler
# Input website
# helsinki.fi
# Searcing...
# <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
# <html><head>
# <title>301 Moved Permanently</title>
# </head><body>
# <h1>Moved Permanently</h1>
# <p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
# </body></html>
