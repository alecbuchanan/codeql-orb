# #!/bin/bash

# if [ -z "$CIRCLE_PULL_REQUEST" ]
# then
#   echo "CIRCLE_PULL_REQUEST is empty"
#   # Run the script in upload_results.sh
#   echo "$GITHUB_TOKEN" | ./codeql/codeql github upload-results --repository=alecbuchanan/codeql-orb --ref="refs/heads/${CIRCLE_BRANCH}" --commit="$CIRCLE_SHA1" --sarif="./codeql/temp/results-js.sarif" --github-url="https://github.com/" --github-auth-stdin
# else
#   echo "CIRCLE_PULL_REQUEST is NOT empty"
#   # Run this script
#   echo "$GITHUB_TOKEN" | ./codeql/codeql github upload-results --repository=alecbuchanan/codeql-orb --ref="refs/pull/${CIRCLE_PULL_REQUEST##*/}/head" --commit="$CIRCLE_SHA1" --sarif="./codeql/temp/results-js.sarif" --github-url="https://github.com/" --github-auth-stdin
# fi