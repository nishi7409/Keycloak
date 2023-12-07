FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ubuntu-server
RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y wget

WORKDIR /keycloak

# installs 17.0.9
RUN wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz
RUN tar -xvf jdk-17_linux-x64_bin.tar.gz -C /opt
RUN rm -rf *.tar.gz
RUN echo "export PATH=$PATH:/opt/jdk-17.0.9/bin" >> ~/.bashrc

COPY . /keycloak

# COPY sleep.sh sleep.sh
RUN echo "sleep infinity" >> sleep.sh
RUN chmod 777 sleep.sh

ENTRYPOINT ["/bin/bash", "/keycloak/sleep.sh"]