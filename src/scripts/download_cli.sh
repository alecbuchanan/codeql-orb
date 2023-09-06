#!/bin/bash

# Download and extract the CodeQL bundle
sudo curl -L https://github.com/github/codeql/releases/latest/download/codeql-bundle.tar.gz -o codeql-bundle.tar.gz
sudo tar -xzf codeql-bundle.tar.gz -C /usr/local/
sudo rm codeql-bundle.tar.gz

# Add the CodeQL CLI to the PATH
echo "export PATH=\$PATH:/usr/local/codeql-runner-linux64" | sudo tee -a "$BASH_ENV" > /dev/null
# shellcheck source=/dev/null
source "$BASH_ENV"