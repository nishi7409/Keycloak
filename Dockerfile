FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
USER root

RUN apt-get update && apt-get install -y ubuntu-server
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y wget openjdk-17-jdk

# Keycloak directory
WORKDIR /keycloak
COPY . /keycloak
RUN chmod -R 777 /keycloak

# Keycloak
RUN cp /keycloak/deployment/keycloak.service /etc/systemd/system/keycloak.service

# COPY sleep.sh sleep.sh
RUN echo "sleep infinity" >> sleep.sh
RUN chmod 777 sleep.sh
ENTRYPOINT ["/bin/bash", "/keycloak/sleep.sh"]