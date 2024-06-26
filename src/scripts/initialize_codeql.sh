#!/bin/bash
set -e

# Ensure the LANGUAGE_IDENTIFIER and CODEQL_DIR environment variable is set
if [ -z "$LANGUAGE_IDENTIFIER" ] || [ -z "$CODEQL_DIR" ]; then
  echo "LANGUAGE_IDENTIFIER and CODEQL_DIR environment variables must be set"
  exit 1
fi

# Check if the user is root
if [[ $EUID == 0 ]]; then export SUDO=""; else
  # Check if we have write access to the necessary directories
  if [ ! -w "$CODEQL_DIR" ] || [ ! -w codeql-dbs ]; then
    export SUDO="sudo";
  fi
fi

# Create the CodeQL directory if it doesn't exist
$SUDO mkdir -p "$CODEQL_DIR"

# Download the latest CodeQL bundle
$SUDO curl -LO https://github.com/github/codeql-action/releases/latest/download/codeql-bundle-linux64.tar.gz

# Extract the downloaded tar.gz file into the specified directory
$SUDO tar xzvf codeql-bundle-linux64.tar.gz -C "$CODEQL_DIR" --strip-components=1

# Remove the tar.gz file after extraction
$SUDO rm codeql-bundle-linux64.tar.gz

# Print the CodeQL absolute path for reference
echo "CodeQL directory: $CODEQL_DIR"

# Navigate to $CODEQL_DIR before creating the CodeQL databases directory
cd "$CODEQL_DIR" || exit 1

# Create the directory for CodeQL databases if it doesn't already exist
$SUDO mkdir -p codeql-dbs

# Change the ownership of the codeql-dbs directory to the current user
$SUDO chown -R "$(whoami)" codeql-dbs

# Use the language from the environment variable to create a CodeQL database
CMD="./codeql database create ./codeql-dbs/repo-db --language=\"$LANGUAGE_IDENTIFIER\" --source-root /home/circleci/project"
if [ -n "$BUILD_MODE" ]; then
  CMD="$CMD --build-mode=\"$BUILD_MODE\""
fi
if [ -n "$COMMAND" ]; then
  CMD="$CMD --command=\"$COMMAND\""
fi
sh -c "$CMD"