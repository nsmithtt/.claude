---
name: branch-tt-mlir
description: Create a new working branch.
---

Come up with a good branch name based on the current context, if it's coming from a github issue, it could just be the issue number.
Remove any stale build directories rm -rf build.
Use git checkout -b plus the branch name you came up with & prefixed with env var ${USER}/.
Use git fetch --tags --all to pull the latest from the repo.
Use git rebase origin/main to rebase your new branch on the latest.
