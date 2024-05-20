#!/bin/bash

# Ensure the LANGUAGE_IDENTIFIER and CODEQL_DIR environment variable is set
if [ -z "$LANGUAGE_IDENTIFIER" ] || [ -z "$CODEQL_DIR" ]; then
  echo "LANGUAGE_IDENTIFIER and CODEQL_DIR environment variables must be set"
  exit 1
fi

# Create the CodeQL directory if it doesn't exist
mkdir -p "$CODEQL_DIR"

# Download the latest CodeQL bundle
wget https://github.com/github/codeql-action/releases/latest/download/codeql-bundle-linux64.tar.gz -O codeql-bundle-linux64.tar.gz

# Extract the downloaded tar.gz file into the specified directory
tar xzvf codeql-bundle-linux64.tar.gz -C "$CODEQL_DIR" --strip-components=1

# Remove the tar.gz file after extraction
rm codeql-bundle-linux64.tar.gz

# Print the CodeQL absolute path for reference
echo "CodeQL directory: $CODEQL_DIR"

# Navigate to $CODEQL_DIR before creating the CodeQL databases directory
cd "$CODEQL_DIR" || exit 1

# Create the directory for CodeQL databases if it doesn't already exist
mkdir -p codeql-dbs

# Use the language from the environment variable to create a CodeQL database
./codeql database create ./codeql-dbs/repo-db --language="$LANGUAGE_IDENTIFIER" --source-root /home/circleci/project

# List all files and directories in the current directory\
ls -la