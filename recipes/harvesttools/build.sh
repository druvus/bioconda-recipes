#!/bin/bash

mkdir -p $PREFIX/bin


./bootstrap.sh
./configure --prefix=$PREFIX --with-protobuf=$PREFIX --with-capnp=$PREFIX

make
make install




