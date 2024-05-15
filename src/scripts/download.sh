#!/bin/bash

# Download the latest CodeQL bundle
wget https://github.com/github/codeql-action/releases/latest/download/codeql-bundle-linux64.tar.gz -O codeql-bundle-linux64.tar.gz

# Extract the downloaded tar.gz file
tar xzvf codeql-bundle-linux64.tar.gz

# Remove the tar.gz file after extraction
rm codeql-bundle-linux64.tar.gz

# Add the CodeQL directory to the PATH
export PATH=$(pwd)/codeql:$PATH