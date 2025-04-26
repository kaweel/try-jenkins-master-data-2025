FROM jenkins/jenkins:lts

USER root

RUN mkdir -p /var/log/jenkins /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins /var/cache/jenkins

USER jenkins

## JVM 8GB
ENV JAVA_OPTS="-Xmx8192m" 