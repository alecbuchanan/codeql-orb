#!/bin/bash

# Ensure the LANGUAGE_IDENTIFIER and CODEQL_DIR environment variable is set
if [ -z "$LANGUAGE_IDENTIFIER" ] || [ -z "$CODEQL_DIR" ]; then
  echo "LANGUAGE_IDENTIFIER and CODEQL_DIR environment variables must be set"
  exit 1
fi


# Navigate to $CODEQL_DIR before creating the CodeQL databases directory
cd "$CODEQL_DIR" || exit 1

# Create the directory for CodeQL databases if it doesn't already exist
mkdir -p codeql-dbs

# Use the language from the environment variable to create a CodeQL database
./codeql database create ./codeql-dbs/repo-db --language="$LANGUAGE_IDENTIFIER" --source-root /home/circleci/project

# Export the Language Identifier for all subsequent steps
echo "export LANGUAGE_IDENTIFIER='$LANGUAGE_IDENTIFIER'" >> "$BASH_ENV"