#!/bin/bash
export TTMLIR_TOOLCHAIN_DIR=/opt/ttmlir-toolchain-uplift

set -e

if [ ! -d "${TTMLIR_TOOLCHAIN_DIR}" ]; then
  sudo mkdir -p ${TTMLIR_TOOLCHAIN_DIR}
  sudo chown -R ${USER} ${TTMLIR_TOOLCHAIN_DIR}
fi

cmake -B env/build env -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
cmake --build env/build
