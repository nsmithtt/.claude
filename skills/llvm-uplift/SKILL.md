---
name: uplift-llvm
description: Uplift llvm and associated third party projects in tt-mlir.
model: Opus
allowed-tools: Bash, Read, Grep, Edit, Task
---

The goal of this job is to successfully uplift three of our 3rd party dependencies, llvm, stablehlo, and shardy.  Below you will find instructions on how to perform each step, along with an execution plan to successfully perform the uplift.  The when complete, the result should be a successful build of tt-mlir against the upgraded toolchain.

Shardy github: https://github.com/openxla/shardy.git

Third party git hashes are set in file `env/CMakeLists.txt`.

## Available skill scripts

These scripts are located in a subdirectory of this skill.

- `scripts/skip_phase1.sh`: Checks to see if we can skip phase 1.
- `scripts/build_env.sh`: Builds the toolchain as part of phase 1.
- `scripts/build_ttmlir.sh`: Builds the ttmlir project as part of phase 3.

## Plan

The plan is composed of the following phases.

### Phase 1. Building the toolchain.

This phase can be skipped if a previous skill invocation has already built the
toolchain.  Check if the `scripts/skip_phase1.sh` script passes, if it does,
we should skip this phase.

Otherwise, build the new toolchain using script `scripts/build_env.sh`. If any patches do not cleanly apply, you may need to fixup the patches. For shardy you might need to clone shardy, checkout the SHARDY_VERSION, and update the patch to be compatible with the shardy project.

### Phase 2. Rebase onto the latest main.

Rebase using `ours` merge strategy to bias conflict resolution to main:
```bash
git fetch --all
git rebase -X ours origin/main
```

### Phase 3. Building tt-mlir and uplifting API's.

Build tt-mlir project using script `scripts/build_ttmlir.sh`, iteravely resolving all build errors. Do not refactor code unless absolutely necessary, try to keep changes mechanical and diffs minimal.

### Phase 4. Cleanup and commit.

Next run the precommit lint to reformat the code (it's OK if fails, that just
means it reformatted some code):
```bash
export TTMLIR_TOOLCHAIN_DIR=/opt/ttmlir-toolchain-uplift
source env/activate
pre-commit run --all-files
```

Git commit the changes to checkpoint our progress with a short commit message.
```bash
git commit -am "llvm-uplift build fixes"
```

## Additional rules:
- Update all deprecated apis, do not use -Wno-deprecated-declarations to avoid API deprecations.
