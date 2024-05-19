#!/bin/bash

# Ensure required environment variables are set
if [ -z "$CODEQL_DIR" ] || [ -z "$repo" ] || [ -z "$CIRCLE_BRANCH" ] || [ -z "$CIRCLE_SHA1" ] || [ -z "$SARIF_FILE_PATH" ] || [ -z "$GITHUB_TOKEN" ]; then
    echo "One or more required environment variables are missing."
    exit 1
fi

# Upload CodeQL analysis results to GitHub
if "${CODEQL_DIR}/codeql" github upload-results \
                --repository="$repo" \
                --ref="refs/heads/${CIRCLE_BRANCH}" \
                --commit="$CIRCLE_SHA1" \
                --sarif="$SARIF_FILE_PATH" \
                --github-url="https://github.com/" \
                --github-auth-stdin <<< "$GITHUB_TOKEN"
                echo "Successfully uploaded SARIF file to GitHub."
else
    echo "Failed to upload SARIF file to GitHub."
    exit 1
fi