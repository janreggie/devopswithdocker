FROM node:10

RUN git clone https://github.com/docker-hy/frontend-example-docker.git /app && \
  useradd -m frontend
WORKDIR /app
RUN chown -R frontend:frontend .
USER frontend

RUN npm install && \
  npm audit fix
ENV API_URL=http://localhost:8000
EXPOSE 5000
CMD ["npm", "start"]
