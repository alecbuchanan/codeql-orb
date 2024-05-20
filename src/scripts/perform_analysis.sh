#!/bin/bash

# Ensure the CODEQL_DIR environment variable is set
if [ -z "$CODEQL_DIR" ]; then
  echo "CODEQL_DIR environment variables must be set"
  exit 1
fi

# Check if SARIF_FILE_PATH is an empty string. If it is, set it to a default value
if [ -z "$SARIF_FILE_PATH" ]; then
  export SARIF_FILE_PATH="./temp/results-${CIRCLE_WORKFLOW_JOB_ID}.sarif"
fi

#Print the SARIF_FILE_PATH
echo "SARIF File Path: $SARIF_FILE_PATH"

# Navigate to the CodeQL directory and create a temp directory if it doesn't exist
cd "$CODEQL_DIR" || exit
mkdir -p temp

# Run the CodeQL database analyze command
./codeql database analyze ./codeql-dbs/repo-db --format=sarif-latest --output="${SARIF_FILE_PATH}"

# Conditional execution based on the presence of a pull request
if [ -z "$CIRCLE_PULL_REQUEST" ]; then
    # No pull request, upload results for a branch
    if "${CODEQL_DIR}/codeql" github upload-results \
                    --repository="$repo" \
                    --ref="refs/heads/${CIRCLE_BRANCH}" \
                    --commit="$CIRCLE_SHA1" \
                    --sarif="$SARIF_FILE_PATH" \
                    --github-url="https://github.com/" \
                    --github-auth-stdin <<< "$GITHUB_TOKEN"; then
        echo "Successfully uploaded SARIF file to GitHub."
    else
        echo "Failed to upload SARIF file to GitHub."
        exit 1
    fi
else
    # Pull request exists, upload results for a pull request
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
fi
