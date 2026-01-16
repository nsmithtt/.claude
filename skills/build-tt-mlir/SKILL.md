---
name: build-tt-mlir
description: Common ways of building tt-mlir including special targets.
---

tt-mlir project is configured and built using cmake and generally follows cmake
idioms and practices.

tt-mlir uses a venv, so always be sure to source the venv before running any
build command:
```bash
source env/activate
```

Configuring & Building tt-mlir (in general):
```bash
source env/activate
cmake -G Ninja -B build \
    -DCMAKE_CXX_COMPILER=clang++-17 \
    -DCMAKE_C_COMPILER=clang-17 \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
    -DTTMLIR_ENABLE_RUNTIME=ON \
    -DTTMLIR_ENABLE_RUNTIME_TESTS=ON \
    -DTT_RUNTIME_ENABLE_PERF_TRACE=ON \
    -DTTMLIR_ENABLE_PYKERNEL=ON \
    -DTTMLIR_ENABLE_TTNN_JIT=ON \
    -DTTMLIR_ENABLE_STABLEHLO=ON \
    -DTTMLIR_ENABLE_OPMODEL=ON \
    -DTT_RUNTIME_DEBUG=ON
cmake --build build
```

After configuring once you can just:
```bash
source env/activate
cmake --build build
```

ttrt is a common tool used to run compiler generated flatbuffers, to build it
you must use this target which will install it into the venv:
```bash
cmake --build build --target ttrt
```
