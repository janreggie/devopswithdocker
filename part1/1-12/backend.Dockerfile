FROM ubuntu:20.04
WORKDIR /root
RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y git curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN git clone https://github.com/docker-hy/backend-example-docker.git backend-example-docker
WORKDIR /root/backend-example-docker
RUN npm install
ENV FRONT_URL=http://localhost:5000
CMD ["npm", "start"]
