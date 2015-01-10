#!/bin/bash
set -e

PLUGINS_ENDPOINT=http://updates.jenkins-ci.org/latest/
JENKINS_HOME=/var/jenkins
JENKINS_WAR=/opt/jenkins

mkdir -p $DATA/plugins

if find $DATA/plugins -maxdepth 0 -empty | read v; then
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/checkstyle.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/hipchat.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/greenballs.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/credentials.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ssh-credentials.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ssh-agent.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git-client.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github-api.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ghprb.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github-oauth.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/scm-api.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/javancss.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/delivery-pipeline-plugin.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/pmd.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/violations.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ws-cleanup.hpi)
fi

#chown -R jenkins $DATA

exec "java -jar $JENKINS_WAR/jenkins.war"
