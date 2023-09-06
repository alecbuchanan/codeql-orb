#!/bin/bash

# Download and extract the CodeQL CLI
sudo curl -L https://github.com/github/codeql-cli-binaries/releases/latest/download/codeql-linux64.zip -o codeql.zip
sudo unzip codeql.zip -d /usr/local/bin/
sudo rm codeql.zip

# Add the CodeQL CLI to the PATH
echo "export PATH=\$PATH:/usr/local/bin/codeql-linux64" | sudo tee -a "$BASH_ENV" > /dev/null
# shellcheck source=/dev/null
source "$BASH_ENV"