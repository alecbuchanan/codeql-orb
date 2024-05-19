#!/bin/bash

# Define the directory for CodeQL
CODEQL_DIR="/home/circleci/codeql"

# Create the CodeQL directory if it doesn't exist
mkdir -p "$CODEQL_DIR"

# Download the latest CodeQL bundle
wget https://github.com/github/codeql-action/releases/latest/download/codeql-bundle-linux64.tar.gz -O codeql-bundle-linux64.tar.gz

# Extract the downloaded tar.gz file into the specified directory
tar xzvf codeql-bundle-linux64.tar.gz -C "$CODEQL_DIR" --strip-components=1

# Remove the tar.gz file after extraction
rm codeql-bundle-linux64.tar.gz

# Add the CodeQL directory to your PATH for the current session
export PATH="$CODEQL_DIR:$PATH"

# Make the PATH change persistent across sessions by adding it to ~/.bashrc
echo 'export PATH="/home/circleci/codeql:$PATH"' >> ~/.bashrc

# Now you can run the CodeQL executable directly with 'codeql'