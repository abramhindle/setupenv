#!/usr/bin/env bash

#wget http://downloads.sourceforge.net/project/boost/boost/1.56.0/boost_1_56_0.tar.gz
tar xvfz boost_1_56_0.tar.gz
mv boost_1_56_0 src
cd src
./bootstrap.sh --with-libraries=filesystem,program_options,system,atomic,log,regex,thread,timer,signals,iostreams --prefix=`realpath ..`/bin
./b2 -j4
./b2 install
cd ..
mkdir -p bin/bin
cd bin/bin
ln -s ../../src/bjam
