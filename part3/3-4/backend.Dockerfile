FROM ubuntu:20.04
WORKDIR /app
RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y git curl && \
  bash -c "curl -sL https://deb.nodesource.com/setup_10.x | bash" && \
  apt-get install -y nodejs && \
  git clone https://github.com/docker-hy/backend-example-docker.git backend-example-docker && \
  # Cleanup
  apt-get purge -y --auto-remove git curl && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -m backend

WORKDIR /app/backend-example-docker
RUN touch ./logs.txt && \
  chown -R backend:backend .

USER backend

RUN npm install && npm audit fix
ENV FRONT_URL=http://localhost:5000
EXPOSE 8000
CMD ["npm", "start"]
