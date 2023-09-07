#!/bin/bash

##todo, make this a parameter
mkdir codeql-dbs
./codeql/codeql database create ./codeql-dbs/repo-db --language=javascript --source-root=./my-app