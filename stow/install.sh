#!/usr/bin/env bash
git clone git://git.savannah.gnu.org/stow.git
mv stow src
REVISION=`cat src/.git/refs/heads/master`
mkdir ${REVISION}
mv src ${REVISION}
cd ${REVISION}/src

autoreconf
./configure --prefix=`realpath ..`/bin

touch texi2html
chmod oug+x texi2html

make
make install
cd ../..
cp setupenv.sh ${REVISION}
