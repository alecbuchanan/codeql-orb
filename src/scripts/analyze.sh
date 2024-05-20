#!/bin/bash

# Ensure the CODEQL_DIR environment variable is set
if [ -z "$CODEQL_DIR" ]; then
  echo "CODEQL_DIR environment variables must be set"
  exit 1
fi

# Check if SARIF_FILE_PATH is an empty string. If it is, set it to a default value
if [ -z "$SARIF_FILE_PATH" ]; then
  export SARIF_FILE_PATH="./temp/results-"$CIRCLE_WORKFLOW_JOB_ID".sarif"
fi

# Navigate to the CodeQL directory and create a temp directory if it doesn't exist
cd "$CODEQL_DIR" || exit
mkdir -p temp

# Run the CodeQL database analyze command
./codeql database analyze ./codeql-dbs/repo-db --format=sarif-latest --output="${SARIF_FILE_PATH}"