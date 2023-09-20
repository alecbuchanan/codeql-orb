#!/bin/bash

echo "$GITHUB_TOKEN" | ./codeql/codeql github upload-results --repository=alecbuchanan/codeql-orb --ref="refs/pull/${CIRCLE_PULL_REQUEST##*/}/head" --commit="$CIRCLE_SHA1" --sarif="./codeql/temp/results-js.sarif" --github-url="https://github.com/" --github-auth-stdin