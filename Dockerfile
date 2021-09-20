# Copyright 2021 ArmyOfEvilRobots. All rights reserved.
FROM ubuntu:focal

WORKDIR /tmp
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install curl gdebi-core wget libterm-readline-gnu-perl && \
    wget https://github.com/Motion-Project/motion/releases/download/release-4.3.2/focal_motion_4.3.2-1_amd64.deb && \
    gdebi -n focal_motion_4.3.2-1_amd64.deb && \
    rm focal_motion_4.3.2-1_amd64.deb
RUN mkdir -p /opt/motion_configs && \
    mkdir -p /opt/motion_scripts && \
    mkdir -p /opt/motion_video && \
    mkdir -p /var/log/motion
COPY entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh

WORKDIR /opt
VOLUME /opt/motion_configs
VOLUME /opt/motion_scripts
VOLUME /opt/motion_video
VOLUME /var/log/motion

EXPOSE 8081

ENV SLACK_CHANNELS=
ENV SLACK_OAUTH_BEARER=
ENV SLACK_NOTIFY_WEBHOOK=

ENTRYPOINT /bin/entrypoint.sh



