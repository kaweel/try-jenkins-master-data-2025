FROM debian:bullseye-slim

RUN mkdir -p /var/jenkins_home /var/log/jenkins
RUN groupadd -g 1000 jenkins
RUN useradd -d /var/jenkins_home -u 1000 -g jenkins -m -s /bin/bash jenkins
RUN chown -R jenkins:jenkins /var/jenkins_home /var/log/jenkins

USER jenkins
VOLUME ["/var/jenkins_home", "/var/log/jenkins"]
CMD ["echo", "Jenkins Data Container Ready."]
