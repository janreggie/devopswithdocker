#!/usr/bin/env fish

# I ran the following command to inspect the history of the image
# to see how it is built:
#   docker history devopsdockeruh/pull_exercise
# From there, I saw that it appears to be a simple node app.

# I then ran the following command to inspect the file system a bit:
#   docker run -it --entrypoint sh devopsdockeruh/pull_exercise
# In it I saw a README.md that says the following:
#   This is the readme, use input "basics" to complete this exercise.

# I gave it a try by running
#   docker run -it devopsdockeruh/pull_exercise
# and then typing in `basics`.
# The following was printed on screen:
#   You found the correct password. Secret message is:
#   "This is the secret message"

docker run -it devopsdockeruh/pull_exercise
