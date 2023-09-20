#!/bin/bash

# Download and extract the CodeQL bundle
wget https://github.com/github/codeql-action/releases/latest/download/codeql-bundle-linux64.tar.gz -O codeql-bundle-linux64.tar.gz
sudo tar -xzvf codeql-bundle-linux64.tar.gz ##-C /usr/local/
rm codeql-bundle-linux64.tar.gz

# # Add the CodeQL CLI to the PATH
path_to_codeql=$(pwd)/codeql
export PATH="$path_to_codeql:$PATH"
# CODEQL_PATH=$(pwd)/codeql
# export PATH="$CODEQL_PATH:$PATH"