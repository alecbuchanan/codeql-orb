#!/bin/bash

# Download and extract the CodeQL CLI
curl -L https://github.com/github/codeql-cli-binaries/releases/latest/download/codeql-linux64.zip -o codeql.zip
unzip codeql.zip -d /usr/local/bin/
rm codeql.zip

# Add the CodeQL CLI to the PATH
echo 'export PATH=$PATH:/usr/local/bin/codeql-linux64' >> "$BASH_ENV"
source "$BASH_ENV"
