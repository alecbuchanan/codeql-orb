#!/bin/bash

# Download the latest CodeQL bundle
wget https://github.com/github/codeql-action/releases/latest/download/codeql-bundle-linux64.tar.gz -O codeql-bundle-linux64.tar.gz

# Extract the downloaded tar.gz file
tar xzvf codeql-bundle-linux64.tar.gz

# Remove the tar.gz file after extraction
rm codeql-bundle-linux64.tar.gz

# Declare the CODEQL_DIR variable and assign it separately to avoid masking values
CODEQL_DIR=$(pwd)/codeql
export PATH=$CODEQL_DIR:$PATH