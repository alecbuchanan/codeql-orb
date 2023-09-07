#!/bin/bash

# Download and extract the CodeQL bundle
wget https://github.com/github/codeql-action/releases/latest/download/codeql-bundle-linux64.tar.gz -O codeql-bundle-linux64.tar.gz
tar -xzvf codeql-bundle-linux64.tar.gz -C /usr/local/
rm codeql-bundle-linux64.tar.gz

# Add the CodeQL CLI to the PATH
echo "export PATH=\$PATH:/usr/local/codeql-runner-linux64" | sudo tee -a "$BASH_ENV" > /dev/null
# shellcheck source=/dev/null
source "$BASH_ENV"