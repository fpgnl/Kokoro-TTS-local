#!/bin/zsh

# Add upstream if it doesn't exist
if ! git remote | grep -q "upstream"; then
    git remote add upstream https://github.com/PierrunoYT/Kokoro-TTS-Local.git
fi

# Sync with upstream repository
git fetch upstream

# Update local master branch with upstream changes
git merge upstream/master

# Push local changes to origin
git push origin master
