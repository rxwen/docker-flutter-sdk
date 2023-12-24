FROM swift:5.9.2
MAINTAINER Raymond Wen

ENV VERSION 3.16.5
RUN apt-get update && apt-get install -y curl make git bzip2 xz-utils wget unzip
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${VERSION}-stable.tar.xz
RUN tar xvf flutter_linux_${VERSION}-stable.tar.xz
RUN rm flutter_linux_${VERSION}-stable.tar.xz

ENV PATH $PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin
RUN git config --global --add safe.directory /flutter
RUN flutter precache

# https://download.java.net/java/GA/jdk19.0.1/afdd2e245b014143b62ccb916125e3ce/10/GPL/openjdk-19.0.1_linux-x64_bin.tar.gz
RUN wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
RUN tar xvf openjdk-17.0.2_linux-x64_bin.tar.gz
RUN mv jdk-17.0.2/ /opt/jdk

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH

RUN wget https://github.com/pinterest/ktlint/releases/download/1.1.0/ktlint-1.1.0.zip
RUN unzip ktlint-1.1.0.zip
RUN mv ktlint-1.1.0/bin/ktlint /usr/local/bin
RUN rm -rf ktlint*

ENV SWIFT_FORMAT_VERSION=509.0.0
RUN apt-get update && apt-get install -y curl make git bzip2 xz-utils wget unzip
RUN git clone https://github.com/apple/swift-format.git
RUN cd swift-format && git checkout $SWIFT_FORMAT_VERSION
RUN cd swift-format && swift build -c release
RUN find swift-format/.build -name swift-format -exec mv {} /usr/local/bin/swift-format \;
RUN rm -rf swift-format
