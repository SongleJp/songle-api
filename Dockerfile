# -*- coding: utf-8 -*-
FROM node:12
MAINTAINER Takahiro INOUE <takahiro.inoue@aist.go.jp>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /work

####
## dependent packages for docker build
####

RUN sed -i -e "s/http:\/\/archive.ubuntu.com/http:\/\/jp.archive.ubuntu.com/g" /etc/apt/sources.list

RUN apt update     && \
    apt -y install    \
      curl

ADD . /work

####
## application deploy
####

RUN npm install
