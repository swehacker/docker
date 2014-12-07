FROM ubuntu
MAINTAINER Patrik Falk <patrik@patrikfalk.com>

# Installation
RUN apt-get update
RUN apt-get install -y iptables ca-certificates openjdk-7-jdk git-core maven curl

ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

RUN for plugin in chucknorris greenballs scm-api git-client git ws-cleanup violations pmd javaNCSS checkstyle delivery-pipeline-plugin;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

VOLUME /var/lib/docker

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/jenkins/jenkins.war" ]
