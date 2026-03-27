#!/bin/bash
export TTMLIR_TOOLCHAIN_DIR=/opt/ttmlir-toolchain-uplift
source env/activate
set -e
pre-commit run --all-files
