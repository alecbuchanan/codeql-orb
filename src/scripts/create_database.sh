#!/bin/bash

# Ensure the script receives exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <language>"
    exit 1
fi

# Assign the first argument to a variable for clarity
LANGUAGE="$1"

# Create the directory for CodeQL databases if it doesn't already exist
mkdir -p codeql-dbs

# Use the provided language to create a CodeQL database
./codeql/codeql database create ./codeql-dbs/repo-db --language="$LANGUAGE" --source-root=./my-app