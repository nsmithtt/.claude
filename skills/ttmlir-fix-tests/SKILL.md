---
name: ttmlir-fix-tests
description: Fix failing tests in tt-mlir.
model: Opus
allowed-tools: Bash, Read, Grep, Edit, Task
---

The goal of this skill is to fix each failing test in tt-mlir and commit each
fix in its own independent commit for easier review.

Before running the test suite, collect a system descriptor from ttrt (note: you
only need to do this once):
```bash
source env/activate
ttrt query --save-artifacts
```

## Phase 1. Health check.

Use the following command to check all unit tests.

```bash
source env/activate
cmake --build build --target check-ttmlir
```

## Phase 2. Reproduce and fix individual failures.

Use `llvm-lit` as described in the repo's CLAUDE.md file to run specific tests.

Please commit independent, atomic, fixes for each failing test:
- Fix the test.
- Run `source env/activate && pre-commit run --all-files` to reformat the code.
- Git commit the changes to checkpoint our progress with a short commit message.
  Describing the fix made for this single test failure.
