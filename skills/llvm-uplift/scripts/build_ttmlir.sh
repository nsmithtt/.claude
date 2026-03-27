#!/bin/bash
export TTMLIR_TOOLCHAIN_DIR=/opt/ttmlir-toolchain-uplift
source env/activate

set -e

cmake -G Ninja -B build \
    -DCMAKE_CXX_COMPILER=clang++-20 \
    -DCMAKE_C_COMPILER=clang-20 \
    -DCMAKE_BUILD_TYPE=Debug \
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

cmake -G Ninja -B build_Release \
    -DCMAKE_CXX_COMPILER=clang++-20 \
    -DCMAKE_C_COMPILER=clang-20 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
    -DTTMLIR_ENABLE_RUNTIME=ON \
    -DTTMLIR_ENABLE_RUNTIME_TESTS=ON \
    -DTT_RUNTIME_ENABLE_PERF_TRACE= \
    -DTTMLIR_ENABLE_PYKERNEL= \
    -DTTMLIR_ENABLE_TTNN_JIT= \
    -DTTMLIR_ENABLE_STABLEHLO=ON \
    -DTTMLIR_ENABLE_OPMODEL=ON \
    -DTTMLIR_ENABLE_ALCHEMIST_WHEEL=ON \
    -DTT_USE_SYSTEM_SFPI=ON \
    -DTT_RUNTIME_DEBUG=
cmake --build build_Release
cmake --build build_Release --target compile-ttmlir-tests
