FROM ubuntu

# Install packages
RUN apt-get update && \
  apt-get install -y software-properties-common curl && \
  apt-add-repository --yes ppa:fish-shell/release-3 && \
  curl -sSL https://download.docker.com/linux/ubuntu/gpg -o docker.key && \
  apt-key add docker.key && \
  rm docker.key && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y fish git docker-ce docker-ce-cli containerd.io && \
  # Remove sources and unused stuff
  rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY uploadDocker.fish .
RUN chmod +x ./uploadDocker.fish

ENTRYPOINT [ "./uploadDocker.fish" ]
