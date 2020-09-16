#!/usr/bin/env fish

# This Docker image is just the go binary and tools,
# as well as other libraries that I frequently use:
# - github.com/pkg/errors
# - github.com/stretchr/testify/assert
# - github.com/golang/glog

# # To build
# set -l current_directory (dirname (status --current-filename))
# docker build -t janreggie/go:1.15.2 $current_directory
# if test $status -ne 0
#     exit
# end

# To push
docker tag janreggie/go:1.15.2 janreggie/go:latest
docker push janreggie/go:1.15.2
docker push janreggie/go:latest
if test $status -ne 0
    exit
end

# To remove local copies
docker rmi janreggie/go:1.15.2 janreggie/go:latest

# To get from Dockerhub
docker run --rm -it janreggie/go version
