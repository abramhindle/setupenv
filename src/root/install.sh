#!/usr/bin/env bash

WHAT=root
VERSION=6.03.04
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

wget -N http://root.cern.ch/download/root_v${VERSION}.source.tar.gz

tar xvfz root_v${VERSION}.source.tar.gz
