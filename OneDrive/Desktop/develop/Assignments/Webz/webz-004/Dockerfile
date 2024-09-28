# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Optionally, update the container and install some dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install curl vim pcs iputils-ping sudo openjdk-11-jdk gnupg2 ca-certificates lsb-release wget time -y

RUN wget http://ftp.debian.org/debian/pool/main/i/init-system-helpers/init-system-helpers_1.60_all.deb && \
    dpkg -i init-system-helpers_1.60_all.deb && rm init-system-helpers_1.60_all.deb
# Add the correct Jenkins GPG key and repository
RUN wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

#RUN apt-get install -y software-properties-common && add-apt-repository universe
RUN apt-get update && apt-get install -y jenkins

RUN mkdir -p /var/jenkins_home && chown -R jenkins:jenkins /var/jenkins_home

# Set Jenkins home environment variable
ENV JENKINS_HOME /var/jenkins_home

# Expose Jenkins port
EXPOSE 8080

# Start Jenkins
CMD ["jenkins"]


