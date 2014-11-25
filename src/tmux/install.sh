#!/usr/bin/env bash

WHAT=tmux
VERSION=1.9a
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget http://garr.dl.sourceforge.net/project/tmux/tmux/tmux-1.9/tmux-${VERSION}.tar.gz

tar xvfz tmux-${VERSION}.tar.gz
mv tmux-${VERSION} ${VERSION}
cd ${VERSION}

./configure --prefix=${TARGETDIR}
make
make install
