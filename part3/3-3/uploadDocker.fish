#!/usr/bin/env fish

function printHelp
  set -l usage "uploadToDocker: Uploads images to Docker

  ./uploadToDocker [ -h | -u username -p password [-t tag] repo_url destination ]

Pulls repo_url, builds Dockerfile to destination with optional tag and uploads it to Docker Hub.
Destination must include the username (e.g., `user123/my_image` instead of `my_image`).
Does not have 2FA support so don't ask: just use your Access Token.
"
  echo $usage
  exit 0
end

set -l _flag_t
argparse 'h/help' 't=' 'u=' 'p=' -- $argv
if test (count $argv) -ne 2; or set -q _flag_h
  printHelp
end

# Log in to Docker (will really only be useful for much much later)
if test -z $_flag_u
  echo "No username set!"
  exit 2
else if test -z $_flag_p
  echo "No password set!"
  exit 2
end

docker login --username=$_flag_u --password=$_flag_p
if test $status -ne 0
  echo "Could not log-in to $_flag_u"
  exit 2
end

# if test -z $DOCKER_USERNAME || test -z $DOCKER_PASSWORD
#   echo "Needs \$DOCKER_USERNAME and \$DOCKER_PASSWORD to be set"
#   printHelp
# end

if test -z $_flag_t
  set _flag_t 'latest'
end

# Pull $argv[1] to repo
git clone $argv[1] repo >&2
if test $status -ne 0
  echo "Could not pull repository '$argv[1]'"
  exit 1
end

cd repo
docker build -t "$argv[2]:$_flag_t" .
if test $status -ne 0
  echo "Could not compile repo '$argv[1]'"
  exit 1
end

docker push "$argv[2]:$_flag_t"
if test $status -ne 0
  echo "Could not push $argv[2]:$_flag_t to Docker hub"
end
