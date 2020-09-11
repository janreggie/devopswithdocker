FROM ubuntu:20.04
WORKDIR /root
RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y git curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN git clone https://github.com/docker-hy/frontend-example-docker.git frontend-example-docker
WORKDIR /root/frontend-example-docker
RUN npm install
ENV API_URL=http://localhost:8000
CMD ["npm", "start"]
