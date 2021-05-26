#FROM registry.suse.com/suse/sles12sp5:6.5.179
FROM ubuntu:latest

LABEL maintainer="alaghusundhar@hotmail.com"

RUN \
# Update
apt-get update -y && \
# Install Unzip
apt-get install unzip -y && \
# need wget
apt-get install wget -y && \
# vim
apt-get install vim -y

RUN mkdir -p /app/bizx

RUN cd /app/bizx

RUN wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip

RUN unzip terraform_0.12.0_linux_amd64.zip

RUN mv terraform /usr/local/bin/

RUN terraform --version

COPY provider.tf /app/bizx

COPY resource.tf /app/bizx 
