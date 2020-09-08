FROM ubuntu
RUN apt-get update && apt-get -qy dist-upgrade && apt-get -qy install curl
COPY "ask_site.sh" .
RUN ["chmod", "+x", "./ask_site.sh"]
CMD [ "./ask_site.sh" ]
