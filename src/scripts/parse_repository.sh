#!/bin/bash

# Extract the "organization/repo" format from the CIRCLE_REPOSITORY_URL environment variable
repo=$(echo $CIRCLE_REPOSITORY_URL | awk -F'[:/]' '{print $2"/"$3}' | sed 's/\.git$//')

# Print the extracted repository information
echo "Extracted Repository: $repo"