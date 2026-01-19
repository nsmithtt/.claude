---
name: test-tt-mlir
description: Running tests in tt-mlir.
---

tt-mlir uses a venv, so always be sure to source the venv before running any
tests:
```bash
source env/activate
```

There are three primary ways that we test tt-mlir:
1. pytest: e2e live device tests.
2. lit: offline compiler tests that validate IR transformations.
3. gtest: targeted tests for testing internal datastructures used by the
   compiler.

## pytest
These tests are found in directory `test/python/golden` and are our
primary testing mechanism.  A prerequisite to running these tests is
collecting a system descriptor.  After building ttrt with the build-tt-mlir
skill you can collect a system descriptor with:
```bash
source env/activate
ttrt query --save-artifacts
```

Which will write the system descriptor artifact to disk at location that pytest conftest looks at by default `ttrt-artifacts/system_desc.ttsys`.
Note system desc gathering only needs to happen once and only needs to be
regenerated if you change git commits.

## lit
These tests are found in directory `test/ttmlir` and are organized further into
directories by the kind of test it is.

## gtest
We typically only reach for gtest for complicated internal algorithms or
datastructures that are specific to tt-mlir.
