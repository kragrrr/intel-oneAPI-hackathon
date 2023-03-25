#!/bin/bash
#source /opt/intel/inteloneapi/setvars.sh
rm -rf build
build="$PWD/build"
[ ! -d "$build" ] && mkdir -p "$build"
cd build &&
cmake .. &&
cmake --build . &&
make run


