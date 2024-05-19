#!/bin/bash

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

# Export the CodeQL directory for all subsequent steps
echo "export CODEQL_DIR='$CODEQL_DIR'" >> "$BASH_ENV"