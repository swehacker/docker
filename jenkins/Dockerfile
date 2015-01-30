FROM ubuntu
MAINTAINER Patrik Falk <patrik@patrikfalk.com>

# Installation
RUN apt-get update
RUN apt-get install -y iptables ca-certificates openjdk-7-jdk git-core maven curl

ENV JENKINS_HOME /var/jenkins
ENV JENKINS_WAR /opt/jenkins
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins $JENKINS_WAR
RUN curl -sf -o $JENKINS_WAR/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

# This only works if jenkins home is contained inside the container
RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/jenkins/jenkins.war" ]
