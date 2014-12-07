FROM ubuntu
MAINTAINER Patrik Falk <patrik@patrikfalk.com>

# Installation
## Java
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

## Elastic Search
RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo 'deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list

RUN apt-get update
RUN apt-get install -y oracle-java8-installer

ENV LOGSTASH_HOME /opt/logstash

RUN mkdir -p $LOGSTASH_HOME/

EXPOSE 80
#ENTRYPOINT ["java", "-jar", "/opt/jenkins/jenkins.war" ]
