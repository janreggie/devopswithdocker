FROM ubuntu:20.04
WORKDIR /root
RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y git curl && \
  bash -c "curl -sL https://deb.nodesource.com/setup_10.x | bash" && \
  apt install -y nodejs && \
  git clone https://github.com/docker-hy/frontend-example-docker.git frontend-example-docker && \
  # # Don't clean up
  # echo "Don't clean up"
  # --------
  # Cleanup
  echo "Clean up" && \
  apt-get purge -y --auto-remove git curl && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root/frontend-example-docker
RUN npm install
ENV API_URL=http://localhost:8000
EXPOSE 5000
CMD ["npm", "start"]
