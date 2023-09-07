#!/bin/bash

cd codeql && mkdir temp
./codeql database analyze ../codeql-dbs/repo-db javascript-code-scanning.qls --format=sarif-latest --output=./temp/results-js.sarif