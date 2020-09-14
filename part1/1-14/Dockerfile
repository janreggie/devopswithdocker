FROM ruby:2.6.0
WORKDIR "/root"
RUN ["bash", "-c", "apt-get update && apt-get -y dist-upgrade && apt-get install git nodejs"]
RUN ["git", "clone", "https://github.com/docker-hy/rails-example-project.git", "rails-example-project"]
WORKDIR "/root/rails-example-project"
RUN ["bundle", "install"]
RUN ["rails", "db:migrate"]
EXPOSE 3000
CMD ["rails", "s"]
