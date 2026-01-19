#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <gh_link>"
    exit 1
fi

# Your command line arguments
gh_issue_link="$1"
project="tt-mlir"

# Send multiline prompt using heredoc
claude --output-format stream-json << EOF
Use read-gh-issue on this github issue ${gh_issue_link}.
Come up with a good branch name based on the github issue context, it could just be the issue number.
Remove any stale build directories `rm -rf build`.
Use `git checkout -b` plus the branch name you came up with & prefixed with `${USER}/`.
Use `git fetch --tags --all` to pull the latest from the repo.
Use `git rebase origin/main` to rebase your new branch on the latest.
Then create a plan on how to implement this issue in the context of the ${project} project.
Use the skill build-${project} to build your changes to the ${project} project.
Use the skill test-${project} to test your changes to the ${project} project.
Then let's iterate on the following steps:
1. Create a test or tests that reproduces the issue and ensure the test reproduces before making a fix.
2. Iterate on a fix, do not hesitate to add more tests or subtests along the way.
3. Run the entire test suite for the project to ensure no new regressions have been introduced.
4. Use the code-reviewer to review the code, iterate on the feedback.
5. Once finished, use `git commit` with a nice commit message that summarizes the changes.
5. Post a draft PR to github.
EOF
