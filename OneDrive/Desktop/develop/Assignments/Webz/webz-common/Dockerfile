# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Optionally, update the container and install some dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install curl vim pacemaker corosync pcs iputils-ping crmsh apache2 iproute2 sudo docker.io -y

COPY corosync.conf /etc/corosync/corosync.conf

COPY start-coro.sh /usr/local/bin/start-coro.sh
COPY start-pace.sh /usr/local/bin/start-pace.sh
COPY create-html.sh /usr/local/bin/create-html.sh
COPY configure-apache.sh /usr/local/bin/configure-apache.sh
COPY run-all.sh /usr/local/bin/run-all.sh

ENTRYPOINT ["/usr/local/bin/run-all.sh"]
