#!/usr/bin/env bash

WHAT=kenlm
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`
THREADS=2

echo >&2 "THIS IS A HACK. NEWEST GITHUB REPO DOES NOT COME WITH BJAM FILE ANYMORE"
#exit 1

VERSION=2015-07-16
if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

#echo >&2 "building in ${BUILDDIR}"
#cd ${BUILDDIR}

#git clone https://github.com/kpu/kenlm.git ${VERSION}
cd ${VERSION}
cp -ra ~/kenlm/* .
echo "/* IF YOUR BUILD SYSTEM PASSES -DKENLM_MAX_ORDER, THEN CHANGE THE BUILD SYSTEM.
* If not, this is the default maximum order.
* Having this limit means that State can be
* (kMaxOrder - 1) * sizeof(float) bytes instead of
* sizeof(float*) + (kMaxOrder - 1) * sizeof(float) + malloc overhead
*/
#define KENLM_MAX_ORDER 10
#ifndef KENLM_ORDER_MESSAGE
#define KENLM_ORDER_MESSAGE \"If your build system supports changing KENLM_MAX_ORDER, change it there and recompile.  In the KenLM tarball or Moses, use e.g. \`bjam --max-kenlm-order=6 -a'.  Otherwise, edit lm/max_order.hh.\"
#endif" > lm/max_order.hh

./bjam -j32 \
  --prefix=${TARGETDIR} \
  --includedir=${TARGETDIR}/include \
  --max-kenlm-order=10 \
  link=static
./bjam -j32 \
  --prefix=${TARGETDIR} \
  --includedir=${TARGETDIR}/include \
  --max-kenlm-order=10 \
  link=shared


cp -R util/double-conversion ${TARGETDIR}/include/util
cd ..
