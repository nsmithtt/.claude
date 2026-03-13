#!/bin/bash
export TTMLIR_TOOLCHAIN_DIR=/opt/ttmlir-toolchain-uplift
if [ -f ${TTMLIR_TOOLCHAIN_DIR}/venv/bin/activate ]; then
  exit 0
else
  exit 1
fi
