FROM ubuntu:20.04
WORKDIR /app
RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y git curl && \
  bash -c "curl -sL https://deb.nodesource.com/setup_10.x | bash" && \
  apt-get install -y nodejs && \
  git clone https://github.com/docker-hy/frontend-example-docker.git frontend-example-docker && \
  # Cleanup
  echo "Clean up" && \
  apt-get purge -y --auto-remove git curl && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -m frontend

WORKDIR /app/frontend-example-docker
RUN chown -R frontend .

USER frontend

RUN npm install && npm audit fix
ENV API_URL=http://localhost:8000
EXPOSE 5000
CMD ["npm", "start"]
