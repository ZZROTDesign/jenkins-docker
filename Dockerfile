FROM jenkins
MAINTAINER Killian Brackey <killian@zzrot.com>

USER root
RUN mkdir /var/log/jenkins && chown -R jenkins:jenkins /var/log/jenkins
USER jenkins

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"


COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
