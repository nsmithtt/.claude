#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <gh_link>"
    exit 1
fi

# Your command line arguments
gh_issue_link="$1"

# Send multiline prompt using heredoc
claude --output-format stream-json << EOF
Use read-gh-issue on this github issue ${gh_issue_link}.
EOF
