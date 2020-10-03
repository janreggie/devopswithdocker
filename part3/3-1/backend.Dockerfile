FROM ubuntu:20.04
WORKDIR /root
RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y git curl && \
  bash -c "curl -sL https://deb.nodesource.com/setup_10.x | bash" && \
  apt install -y nodejs && \
  git clone https://github.com/docker-hy/backend-example-docker.git backend-example-docker && \
  # # Don't clean up
  # echo "Don't clean up"
  # --------
  # Cleanup
  apt-get purge -y --auto-remove git curl && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root/backend-example-docker
RUN npm install
ENV FRONT_URL=http://localhost:5000
EXPOSE 8000
CMD ["npm", "start"]
