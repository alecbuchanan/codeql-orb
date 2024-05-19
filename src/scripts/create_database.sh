#!/bin/bash

# Ensure the LANGUAGE_IDENTIFIER environment variable is set
if [ -z "$LANGUAGE_IDENTIFIER" ]; then
    echo "Error: LANGUAGE_IDENTIFIER environment variable is not set."
    exit 1
fi

# Navigate to $CODEQL_DIR before creating the CodeQL databases directory
cd "$CODEQL_DIR" || exit 1

# Create the directory for CodeQL databases if it doesn't already exist
mkdir -p codeql-dbs

# Use the language from the environment variable to create a CodeQL database
./codeql/codeql database create ./codeql-dbs/repo-db --language="$LANGUAGE_IDENTIFIER" --source-root /home/circleci/project