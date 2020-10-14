# upload-to-docker

## Compiling to Docker image

Use `docker build (arguments) .`.

## Using Docker image

```bash
$ docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  upload_docker \
    -u USERNAME \
    -p PASSWORD_OR_API_KEY \
    [ -t OPTIONAL_TAG_FOR_PROJECT ] \
    https://LINK/TO/REPOSITORY IMAGE_NAME
```

**Running Docker inside Docker requires a connection to the host's Docker daemon**. If you are using Rootless Docker, you may change that line to something like `-v /run/user/1000/docker.sock:/var/run/docker.sock`.

`-u` and `-p` flags are **required**. Similarly, all flags are required except `-t`, where if not present will just tag the image to `latest`.
Note that you can do `-u $DOCKER_USERNAME` if it is saved as an environment variable.

Note that `IMAGE_NAME` may need to include the username (e.g., `USERNAME/my_first_image`).

## Other questions

### Why do this project

In compliance with 3.3 of the DevOps with Docker MOOC.

### Username and password as arguments instead of environment variables

I have decided that it works better this way.
