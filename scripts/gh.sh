#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <gh_link>"
    exit 1
fi

# Your command line arguments
gh_issue_link="$1"
project="tt-mlir"
user=${USER}

# Send multiline prompt using heredoc
claude --output-format stream-json << EOF
Read this github issue ${gh_issue_link}.
Use branch-tt-mlir skill to create a new branch.
Then create a plan on how to implement this issue in the context of the ${project} project.
Use the build-${project} subagent to build ${project}.
Then let's iterate on the following steps:
1. Create a test or tests that reproduces the issue and ensure the test reproduces before making a fix.
2. Iterate on a fix, do not hesitate to add more tests or subtests along the way.
3. Use the test-${project} subagent to test your changes to the ${project} project.
4. Use the code-reviewer subagent to review the code, iterate on the feedback.
5. Once finished, use git commit with a nice commit message that summarizes the changes.
EOF
