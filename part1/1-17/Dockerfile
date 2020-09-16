FROM alpine:3.12.0
RUN ["apk", "add", "--no-cache", "curl", "git"]
RUN ["sh", "-c", "curl -L 'https://golang.org/dl/go1.15.2.linux-amd64.tar.gz' | tar -C /usr/local -xzf - "]

# "Enable" glibc on container
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Environment variables for GOPATH, PATH
# GOROOT automatically set
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
RUN mkdir -p /root/go/bin /root/go/pkg /root/go/src
ENV PATH=${PATH}:${GOPATH}/bin:${GOROOT}/bin

# Install useful libraries
RUN go get \
        github.com/pkg/errors \
        github.com/stretchr/testify/assert \
        github.com/golang/glog

ENTRYPOINT [ "/usr/local/go/bin/go" ]
