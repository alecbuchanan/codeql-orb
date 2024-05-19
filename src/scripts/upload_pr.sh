#!/bin/bash

# Ensure required environment variables are set
if [ -z "$CODEQL_DIR" ] || [ -z "$repo" ] || [ -z "$CIRCLE_PULL_REQUEST" ] || [ -z "$CIRCLE_SHA1" ] || [ -z "$SARIF_FILE_PATH" ] || [ -z "$GITHUB_TOKEN" ]; then
    echo "One or more required environment variables are missing."
    exit 1
fi

# Upload CodeQL analysis results to GitHub
"${CODEQL_DIR}/codeql" github upload-results \
                --repository="$repo" \
                --ref="refs/pull/${CIRCLE_PULL_REQUEST##*/}/head" \
                --commit="$CIRCLE_SHA1" \
                --sarif="$SARIF_FILE_PATH" \
                --github-url="https://github.com/" \
                --github-auth-stdin <<< "$GITHUB_TOKEN"

if [ $? -eq 0 ]; then
    echo "Successfully uploaded SARIF file to GitHub."
else
    echo "Failed to upload SARIF file to GitHub."
    exit 1
fi