#!/usr/bin/env bash

WHAT=vim
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
UNAME=$(uname)
#BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`
mkdir -p build
BUILDDIR=./build
THREADS=4

echo >&2 "building in ${BUILDDIR}"

cd ${BUILDDIR}
git clone https://github.com/vim/vim.git
cd vim || exit 1
./configure \
  CFLAGS="-g" \
  --prefix=${TARGETDIR} \
  --with-features=huge \
  --enable-multibyte \
  --enable-pythoninterp \
  --enable-rubyinterp \
  --enable-perlinterp \
  --enable-luainterp \
  --enable-cscope || exit 1

make -j${THREADS} || exit 1
make install || exit 1

rm -rf ${BUILDDIR}
