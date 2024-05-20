#!/bin/bash

# Ensure required environment variables are set
if [ -z "$CODEQL_DIR" ] || [ -z "$repo" ] || [ -z "$CIRCLE_PULL_REQUEST" ] || [ -z "$CIRCLE_SHA1" ] || [ -z "$GITHUB_TOKEN" ]; then
    echo "One or more required environment variables are missing."
    exit 1
fi

# Check if SARIF_FILE_PATH is an empty string. If it is, set it to a default value
if [ -z "$SARIF_FILE_PATH" ]; then
    export SARIF_FILE_PATH="./temp/results-${CIRCLE_WORKFLOW_JOB_ID}.sarif"
fi

# Upload CodeQL analysis results to GitHub
if "${CODEQL_DIR}/codeql" github upload-results \
                --repository="$repo" \
                --ref="refs/pull/${CIRCLE_PULL_REQUEST##*/}/head" \
                --commit="$CIRCLE_SHA1" \
                --sarif="$SARIF_FILE_PATH" \
                --github-url="https://github.com/" \
                --github-auth-stdin <<< "$GITHUB_TOKEN"; then
    echo "Successfully uploaded SARIF file to GitHub."
else
    echo "Failed to upload SARIF file to GitHub."
    exit 1
fi