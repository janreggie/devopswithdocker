#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
cd $current_directory
touch logs.txt
docker-compose build
docker history backend frontend

# Histories without cleanup:
#
# Backend (total: 347MB)
# IMAGE               CREATED              CREATED BY                                      SIZE                COMMENT
# 7381a4a7e517        About a minute ago   /bin/sh -c #(nop)  CMD ["npm" "start"]          0B                  
# 866b9609e832        About a minute ago   /bin/sh -c #(nop)  EXPOSE 8000                  0B                  
# 5ab0b2218787        About a minute ago   /bin/sh -c #(nop)  ENV FRONT_URL=http://loca…   0B                  
# ebf716017794        About a minute ago   /bin/sh -c npm install                          18.1MB              
# 84893a907a82        About a minute ago   /bin/sh -c #(nop) WORKDIR /root/backend-exam…   0B                  
# b00ba4b128da        2 minutes ago        /bin/sh -c apt-get update &&   apt-get -y di…   255MB               
# 972de6692900        3 weeks ago          /bin/sh -c #(nop) WORKDIR /root                 0B                  
# 4e2eef94cd6b        6 weeks ago          /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
# <missing>           6 weeks ago          /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B                  
# <missing>           6 weeks ago          /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   811B                
# <missing>           6 weeks ago          /bin/sh -c [ -z "$(apt-get indextargets)" ]     1.01MB              
# <missing>           6 weeks ago          /bin/sh -c #(nop) ADD file:9f937f4889e7bf646…   72.9MB              
#
# Frontend (total: 542MB)
# IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
# a320de2f6d87        6 minutes ago       /bin/sh -c #(nop)  CMD ["npm" "start"]          0B                  
# d83d74e59d86        6 minutes ago       /bin/sh -c #(nop)  EXPOSE 5000                  0B                  
# 63049befe647        6 minutes ago       /bin/sh -c #(nop)  ENV API_URL=http://localh…   0B                  
# a46c1a3474e1        6 minutes ago       /bin/sh -c npm install                          212MB               
# d9ebda7e7784        8 minutes ago       /bin/sh -c #(nop) WORKDIR /root/frontend-exa…   0B                  
# dd6a0b01ad0a        8 minutes ago       /bin/sh -c apt-get update &&   apt-get -y di…   256MB               
# 972de6692900        3 weeks ago         /bin/sh -c #(nop) WORKDIR /root                 0B                  
# 4e2eef94cd6b        6 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
# <missing>           6 weeks ago         /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B                  
# <missing>           6 weeks ago         /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   811B                
# <missing>           6 weeks ago         /bin/sh -c [ -z "$(apt-get indextargets)" ]     1.01MB              
# <missing>           6 weeks ago         /bin/sh -c #(nop) ADD file:9f937f4889e7bf646…   72.9MB              

# Histories with cleanup
#
# Backend (total: 233MB)
#
# IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
# 27f01d96784b        14 seconds ago      /bin/sh -c #(nop)  CMD ["npm" "start"]          0B                  
# 3552cd5def29        17 seconds ago      /bin/sh -c #(nop)  EXPOSE 8000                  0B                  
# 937a9280688b        19 seconds ago      /bin/sh -c #(nop)  ENV FRONT_URL=http://loca…   0B                  
# 155381cf3eea        25 seconds ago      /bin/sh -c npm install                          18.1MB              
# a76f697cf570        39 seconds ago      /bin/sh -c #(nop) WORKDIR /root/backend-exam…   0B                  
# 61c51249d0a3        43 seconds ago      /bin/sh -c apt-get update &&   apt-get -y di…   141MB               
# 972de6692900        3 weeks ago         /bin/sh -c #(nop) WORKDIR /root                 0B                  
# 4e2eef94cd6b        6 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
# <missing>           6 weeks ago         /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B                  
# <missing>           6 weeks ago         /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   811B                
# <missing>           6 weeks ago         /bin/sh -c [ -z "$(apt-get indextargets)" ]     1.01MB              
# <missing>           6 weeks ago         /bin/sh -c #(nop) ADD file:9f937f4889e7bf646…   72.9MB              
#
# Frontend (total: 427MB)
#
# IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
# 6762e4597fa3        6 minutes ago       /bin/sh -c #(nop)  CMD ["npm" "start"]          0B                  
# e310e4d0fbd9        6 minutes ago       /bin/sh -c #(nop)  EXPOSE 5000                  0B                  
# b86000435177        6 minutes ago       /bin/sh -c #(nop)  ENV API_URL=http://localh…   0B                  
# 8ea9468553d9        6 minutes ago       /bin/sh -c npm install                          212MB               
# 9977b253227b        8 minutes ago       /bin/sh -c #(nop) WORKDIR /root/frontend-exa…   0B                  
# 12d30f79f24b        9 minutes ago       /bin/sh -c apt-get update &&   apt-get -y di…   141MB               
# 972de6692900        3 weeks ago         /bin/sh -c #(nop) WORKDIR /root                 0B                  
# 4e2eef94cd6b        6 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
# <missing>           6 weeks ago         /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B                  
# <missing>           6 weeks ago         /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   811B                
# <missing>           6 weeks ago         /bin/sh -c [ -z "$(apt-get indextargets)" ]     1.01MB              
# <missing>           6 weeks ago         /bin/sh -c #(nop) ADD file:9f937f4889e7bf646…   72.9MB              
