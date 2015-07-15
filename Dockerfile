# This is a comment
FROM ubuntu:14.04
MAINTAINER Xiaoyu Wang <htedsv@gmail.com>
RUN apt-get -qq  update
RUN apt-get -y install vim flex subversion git unzip libncurses5-dev xz-utils make wget libssl-dev libbz2-dev libz-dev libc6-i386
RUN apt-get -y install wget make
RUN (cd /root && git clone https://github.com/xuanhuangyiqi/setupenv.git && cd setupenv && bash install)
