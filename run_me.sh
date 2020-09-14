#!/usr/bin/env bash

set -e

export CAT_OUTPUT_DIR="$PWD/CAT"
export CC=clang
export CXX=clang++

rm -rf build/ ; 
mkdir build ; 
cd build ; 
cmake -DCMAKE_INSTALL_PREFIX="$CAT_OUTPUT_DIR" -DCMAKE_BUILD_TYPE=Debug ../ ; 
make ;
make install ;
cd ../ 

if ! test -e compile_commands.json ; then
  ln -s build/compile_commands.json ./ ;
fi
