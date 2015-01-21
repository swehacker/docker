#!/bin/bash
set -e

PLUGINS_ENDPOINT=http://updates.jenkins-ci.org/latest/
JENKINS_HOME=/var/jenkins
JENKINS_WAR=/opt/jenkins

mkdir -p $JENKINS_HOME/plugins

if find $JENKINS_HOME/plugins -maxdepth 0 -empty | read v; then
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/checkstyle.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/hipchat.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/greenballs.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/credentials.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ssh-credentials.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ssh-agent.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git-client.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github-api.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ghprb.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github-oauth.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/scm-api.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/javancss.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/delivery-pipeline-plugin.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/pmd.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/violations.hpi)
    (cd $JENKINS_HOME/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/ws-cleanup.hpi)
fi

#chown -R jenkins $JENKINS_HOME

exec java -jar $JENKINS_WAR/jenkins.war
