#!/usr/bin/env fish

# I ran the following command to run the image in the background
# and to take note of the container ID:
set -l docker_container (docker run -it -d devopsdockeruh/exec_bash_exercise)
echo "Spawned exec_bash_exercise container on $docker_container"

# I then ran the following command to inspect `logs.txt`
# while the container is still running
# although I had to wait for 15 seconds before doing that.
sleep 15s
docker exec -it $docker_container tail ./logs.txt
# Using this, we see that the secret message is `Docker is easy`.

# An alternative would be to use `tail -f ./logs.txt` though.
# I wanted to have everything run in a shell script to minimize human interaction.

# Finally, I killed and removed the original container
docker rm --force $docker_container
