#!/usr/bin/env bash

WHAT=tmux
VERSION=2.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget -N https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz

tar xvfz tmux-${VERSION}.tar.gz
mv tmux-${VERSION} ${VERSION}
cd ${VERSION}

./configure --prefix=${TARGETDIR}
make
make install
