#!/usr/bin/env bash

WHAT=clang
VERSION=3.5.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://llvm.org/releases/3.5.0/clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
tar xvf clang+llvm-3.5.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
mv clang+llvm-3.5.0-x86_64-linux-gnu ${TARGETDIR}
