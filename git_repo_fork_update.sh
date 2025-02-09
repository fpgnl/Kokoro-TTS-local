#!/bin/zsh

# Change to script's directory to ensure we're in the git repo
cd $(realpath "$0")

# Sync with upstream repository
git fetch upstream

# Update local main branch with upstream changes
git merge upstream/main

# Handle merge conflicts - requires manual intervention
if [ $? -ne 0 ]; then
    echo "Merge conflicts encountered. Please resolve them before committing."
    exit 1
fi

# Push local changes to origin
git commit -m "Merge latest changes from upstream"
git push origin main
