FROM ubuntu:16.04
MAINTAINER Raymond Wen

ENV VERSION 2.5.3
RUN apt-get update && apt-get install -y curl make git bzip2 xz-utils wget unzip
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${VERSION}-stable.tar.xz
RUN tar xvf flutter_linux_${VERSION}-stable.tar.xz
RUN rm flutter_linux_${VERSION}-stable.tar.xz

ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
RUN flutter precache
