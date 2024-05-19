#!/bin/bash

# Ensure the LANGUAGE environment variable is set
if [ -z "$LANGUAGE" ]; then
    echo "Error: LANGUAGE environment variable is not set."
    exit 1
fi

# Use the LANGUAGE environment variable directly without assigning it to another variable

# Create the directory for CodeQL databases if it doesn't already exist
mkdir -p codeql-dbs

# Use the language from the environment variable to create a CodeQL database
./codeql/codeql database create ./codeql-dbs/repo-db --language="$LANGUAGE" --source-root=./my-app