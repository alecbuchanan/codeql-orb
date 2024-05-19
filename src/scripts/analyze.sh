#!/bin/bash

# Navigate to the CodeQL directory and create a temp directory if it doesn't exist
cd "$CODEQL_DIR" || exit
mkdir -p temp

# Ensure $LANGUAGE_IDENTIFIER is set
if [ -z "$LANGUAGE_IDENTIFIER" ]; then
    echo "Error: LANGUAGE_IDENTIFIER environment variable is not set."
    exit 1
fi

# Run the CodeQL database analyze command
./codeql database analyze ./codeql-dbs/repo-db --format=sarif-latest --output=./temp/results-"$LANGUAGE_IDENTIFIER".sarif

# Print the full path of the SARIF file for debugging
echo "SARIF file location: $(pwd)/temp/results-$LANGUAGE_IDENTIFIER.sarif"