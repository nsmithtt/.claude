#!/bin/bash
export TTMLIR_TOOLCHAIN_DIR=/opt/ttmlir-toolchain-uplift
source env/activate
cmake -G Ninja -B build \
    -DCMAKE_CXX_COMPILER=clang++-17 \
    -DCMAKE_C_COMPILER=clang-17 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
    -DTTMLIR_ENABLE_RUNTIME=ON \
    -DTTMLIR_ENABLE_RUNTIME_TESTS=ON \
    -DTT_RUNTIME_ENABLE_PERF_TRACE=ON \
    -DTTMLIR_ENABLE_PYKERNEL=ON \
    -DTTMLIR_ENABLE_TTNN_JIT=ON \
    -DTTMLIR_ENABLE_STABLEHLO=ON \
    -DTTMLIR_ENABLE_OPMODEL=ON \
    -DTTMLIR_ENABLE_ALCHEMIST_WHEEL= \
    -DTT_RUNTIME_DEBUG=ON
cmake --build build
cmake --build build --target compile-ttmlir-tests
