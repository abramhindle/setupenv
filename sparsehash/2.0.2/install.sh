  wget https://sparsehash.googlecode.com/files/sparsehash-2.0.2.tar.gz
  tar xvfz sparsehash-2.0.2.tar.gz 
  mv sparsehash-2.0.2 src
  cd src/
  ./configure --prefix=`realpath ..`/bin
  make
  make install
