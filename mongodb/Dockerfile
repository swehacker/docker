# Based on ubuntu:latest, installs MongoDB following the instructions from:
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
FROM ubuntu
MAINTAINER Patrik Falk <patrik@patrikfalk.com>

# Installation
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN apt-get update
RUN apt-get install -y mongodb-org && rm -rf /var/lib/apt/lists/*

# Define mountable directories.
RUN mkdir -p /data/db

# Expose port #27017 from the container to the host 
# - process
EXPOSE 27017
# - http
EXPOSE 28017

CMD ["/usr/bin/mongod"]
