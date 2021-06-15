FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update; \
apt-get upgrade -y --no-install-recommends; \ 
apt-get -y --no-install-recommends install git-core \
gnupg \
flex \
bison \
gperf \
build-essential \
zip \
curl \
zlib1g-dev \
gcc-multilib \
g++-multilib \
libc6-dev-i386 \
lib32ncurses5-dev \
x11proto-core-dev \
libx11-dev \
lib32z-dev \
libgl1-mesa-dev \
libxml2-utils \
xsltproc \
unzip \
python3 \
wget

RUN wget -P /usr/local/bin https://storage.googleapis.com/git-repo-downloads/repo --no-check-certificate; \
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip --no-check-certificate; \
unzip /platform-tools-latest-linux.zip -d /usr/local/bin; \
rm /platform-tools-latest-linux.zip; \
ln -s /usr/bin/python3 /usr/local/bin/python; \
chmod 0500 /usr/local/bin/repo; \
chmod 0500 /usr/local/bin/python

ENV PATH=/usr/local/bin/platform-tools:$PATH

CMD ("/bin/bash")  
