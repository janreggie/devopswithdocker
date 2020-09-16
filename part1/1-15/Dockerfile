FROM node:14
WORKDIR "/root"
RUN ["git", "clone", "https://github.com/janreggie/randomquoter.git", "randomquoter"]
WORKDIR "/root/randomquoter"
RUN ["yarn", "install"]
EXPOSE 3000
CMD ["yarn", "start"]
