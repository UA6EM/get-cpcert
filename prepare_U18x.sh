
#!/bin/bash

function die() {
echo ERROR: $*
exit 1
}

function download() {
mkdir -p libs  || die "make dir libs"
wget -O libs/gost-engine.zip -c --no-check-certificate https://codeload.github.com/gost-engine/engine/zip/1b374532c2d494710c39371e83c197d08c65e8bc || die "download gost-engine"
}

function prereq() {
sudo apt-get install make pkg-config autoconf build-essential -y || die "install soft"
}

function unpack() {
cd libs || die "cd libs"
unzip gost-engine.zip      || die "unpack gost-engine"
ln -s engine-1b374532c2d494710c39371e83c197d08c65e8bc engine || die "ln gost-engine"
cd ..
}


function mk_gost() {
export OPENSSL_ROOT_DIR=$(pwd)/libs/openssl-OpenSSL_1_1_1-stable
echo OPENSSL_ROOT_DIR=$OPENSSL_ROOT_DIR
cd libs/engine
mkdir build
cd build
cmake ..                            || die "cmake gost-engine"
cmake -DCMAKE_BUILD_TYPE=Release .. || die "make gost-engine"
cmake --build . --config Release    || die "build gost-engine"
sudo make install                   || die "install gost-engine"
cd ../../..
sudo cp openssl-config.txt /usr/local/ssl/openssl.cnf || die "add gost-engine to openssl"
}

prereq
download
unpack
mk_cmake
mk_openssl
mk_gost

openssl version
openssl ciphers | grep GOST2012
