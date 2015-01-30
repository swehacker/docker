FROM ubuntu

RUN apt-get update && apt-get install -y sudo openjdk-6-jdk unzip
ADD http://downloads.sourceforge.net/project/openremote/OpenRemote-Controller-2.1.0.zip?r=http%3A%2F%2Fwww.openremote.org%2Fdisplay%2Fforums%2FLinux%2Binstall%2Binstructions&ts=1422637290&use_mirror=netcologne /opt/
WORKDIR /opt
RUN unzip *.zip
RUN rm OpenRemote-Controller-2.1.0.zip
WORKDIR /opt/OpenRemote-Controller-2.1.0/bin
RUN chmod +x openremote.sh

EXPOSE 8080
CMD ./openremote.sh run
