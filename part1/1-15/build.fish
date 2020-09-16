#!/usr/bin/env fish

# # To build
# set -l current_directory (dirname (status --current-filename))
# docker build -t janreggie/randomquoter:0.1.0 $current_directory

# To run
# https://hub.docker.com/r/janreggie/randomquoter
docker run --rm -it -p 3000:3000 janreggie/randomquoter
