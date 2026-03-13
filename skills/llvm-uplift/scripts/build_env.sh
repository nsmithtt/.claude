#!/bin/bash
export TTMLIR_TOOLCHAIN_DIR=/opt/ttmlir-toolchain-uplift

if [ ! -d "${TTMLIR_TOOLCHAIN_DIR}" ]; then
  sudo mkdir -p ${TTMLIR_TOOLCHAIN_DIR}
  sudo chown -R ${USER} ${TTMLIR_TOOLCHAIN_DIR}
fi

cmake -B env/build env
cmake --build env/build
