FROM node:10

RUN git clone https://github.com/docker-hy/backend-example-docker.git /app && \
  # apt-get update && \
  # apt-get install -y postgresql-client && \
  useradd -m backend
WORKDIR /app
RUN touch ./logs.txt && chown -R backend:backend .
USER backend

RUN npm install && \
  npm audit fix
ENV FRONT_URL=http://localhost:5000
EXPOSE 8000
CMD ["npm", "start"]
