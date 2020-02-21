
FROM debian:buster AS rabcdasm_builder

RUN \
    apt-get update -y && \
    apt-get install -y \
      build-essential \
      tar \
      unzip \
      less \
      sed \
      jq \
      wget \
      git \
      nano \
      liblzma-dev && \
    wget https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list && \
    apt-get update --allow-insecure-repositories && apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring && apt-get update && \
    apt-get install -y dmd-compiler && \
    git clone https://github.com/CyberShadow/RABCDAsm.git /rabcdasm && \
    cd /rabcdasm && \
    dmd -run build_rabcdasm.d -od=./bin/

FROM debian:buster AS awesome

WORKDIR /workdir
# #ENV SWF_FILENAME "GemCraft Frostborn Wrath.swf"

COPY --from=rabcdasm_builder /rabcdasm/bin /usr/local/bin

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      host \
      unzip \
      less \
      sed \
      jq \
      nano \
      git && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

COPY scripts/ /usr/local/bin/

#
# # Generic
# RUN apt-get update && \
#     apt-get install --no-install-recommends -y build-essential apt-transport-https && \
#     apt-get install --no-install-recommends -y gnutls-bin \
#         host \
#         unzip \
#         less \
#         sed \
#         jq \
#         xauth \
#         xvfb \
#         zenity \
#         zlib1g \
#         zlib1g-dev \
#         zlibc && \
#     rm -rf /var/lib/apt/lists/* && \
#     apt-get clean
#
#
# # Flash
# RUN mkdir /jre
# # ADD ./utils/jre /jre
# RUN apt-get update && \
#     apt-get install --no-install-recommends -y swftools && \
#     apt-get install --no-install-recommends -y \
#         java-common \
#         libasound2 \
#         libgl1 \
#         libxtst6 \
#         libxxf86vm1 \
#         default-jre \
#         libc6-i386 lib32stdc++6 lib32gcc1 lib32z1 libgtk2.0-0 && \
#     wget http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRSDK.tbz2 -O /tmp/AdobeAIRSDK.tbz2 && \
#     mkdir /FLEX && \
#     tar -xjf /tmp/AdobeAIRSDK.tbz2 -C /FLEX && \
#     wget https://fpdownload.macromedia.com/get/flashplayer/updaters/32/playerglobal32_0.swc -P /root/.FFDec/flashlib && \
## THIS WORKS
#      wget https://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
#      apt-get update --allow-insecure-repositories && apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring && apt-get update
#     apt-get install -y dmd-compiler
#     dmd -run build_rabcdasm.d -od /usr/local/bin/
#     rm -rf /var/lib/apt/lists/* && \
#     apt-get clean
# # RUN dpkg -i /jre/oracle-java8-jre_8u161_amd64.deb && \
# #     rm -f -v /jre/oracle-java8-jre_8u161_amd64.deb && \
# #     rm -rf /var/lib/apt/lists/* && \
# #     apt-get clean
#
# # Download ffdec
# RUN wget -nv --no-check-certificate https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version11.2.0/ffdec_11.2.0.deb -O /tmp/ffdec.deb && \
#     dpkg -i /tmp/ffdec.deb && \
#     rm -f /tmp/ffdec.deb && \
#     rm -rf /var/lib/apt/lists/* && \
#     apt-get clean
