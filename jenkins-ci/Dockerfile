FROM ubuntu
MAINTAINER Patrik Falk <patrik@patrikfalk.com>

# Installation
## Java 8
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

RUN apt-get update
RUN apt-get install -y oracle-java8-installer git-core maven curl

ENV JENKINS_HOME /var/jenkins
ENV JENKINS_WAR /opt/jenkins
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins $JENKINS_WAR
RUN curl -sf -o $JENKINS_WAR/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

VOLUME /var/jenkins

EXPOSE 8080

ADD start.sh /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

CMD /usr/local/bin/start
