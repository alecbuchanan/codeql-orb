#!/bin/bash

# Navigate to the CodeQL directory and create a temp directory if it doesn't exist
cd codeql || exit
mkdir -p temp

# Run the CodeQL database analyze command
./codeql database analyze ../codeql-dbs/repo-db javascript-code-scanning.qls --format=sarif-latest --output=./temp/results-js.sarif