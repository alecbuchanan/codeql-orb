#!/bin/bash

##todo, make this a parameter
mkdir codeql-dbs
./codeql/codeql database create ./codeql-dbs/repo-db --language=javascript --source-root=./my-app
# /usr/local/codeql-runner-linux64/codeql database create ./codeql-dbs/repo-db --language=javascript --source-root=./my-app