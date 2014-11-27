FROM  ubuntu:14.10
MAINTAINER Patrik Falk <patrik@patrikfalk.com>
ENV REFRESHED_AT 2014-11-26

ENV GERRIT_HOME /home/gerrit
ENV GERRIT_ROOT /home/gerrit/gerrit
ENV GERRIT_USER gerrit
ENV GERRIT_WAR /home/gerrit/gerrit.war

#RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install sudo vim-tiny git supervisor openjdk-7-jre-headless

RUN useradd -m $GERRIT_USER
RUN mkdir -p $GERRIT_HOME
RUN chown ${GERRIT_USER}:${GERRIT_USER} $GERRIT_HOME

RUN mkdir -p /var/log/supervisor

ADD http://gerrit-releases.storage.googleapis.com/gerrit-2.9.1.war $GERRIT_WAR
ADD config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chown -R ${GERRIT_USER}:${GERRIT_USER} $GERRIT_HOME

USER gerrit
CMD ["/usr/bin/ls","/home/gerrit"]
RUN java -jar $GERRIT_WAR init --batch -d $GERRIT_ROOT
RUN chown -R ${GERRIT_USER}:${GERRIT_USER} $GERRIT_ROOT

ADD config/gerrit.config /home/gerrit/gerrit/etc/gerrit.config

USER root
EXPOSE 8080 29418
CMD ["/usr/sbin/service","supervisor","start"]
