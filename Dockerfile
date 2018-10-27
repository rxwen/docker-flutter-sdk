FROM ubuntu:16.04
MAINTAINER Raymond Wen

ENV VERSION 0.9.4-beta
RUN apt-get update && apt-get install -y curl make git bzip2 xz-utils
RUN wget https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_v${VERSION}.tar.xz
RUN tar jxvf flutter_linux_v${VERSION}.tar.xz
RUN rm flutter_linux_v${VERSION}.tar.xz

ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
