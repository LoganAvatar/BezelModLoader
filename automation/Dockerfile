FROM debian:latest

ENV SWF_FILENAME "GemCraft Frostborn Wrath.swf/"

COPY $SWF_FILENAME /tmp/

RUN \
    apt-get update && \
    apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32z1 && \
    apt-get install -y wget tar zip && \
    wget http://www.nowrap.de/download/flasm16linux.tgz && \
    mkdir /flasm16linux && \
    tar -xzf flasm16linux.tgz -C /flasm16linux
