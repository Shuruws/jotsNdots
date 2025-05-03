#!/bin/bash

# Build the site
echo "Building site..."
hugo

# Add all changes
echo "Adding changes..."
git add .

# Commit with timestamp
echo "Committing changes..."
git commit -m "Site update: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
echo "Pushing to GitHub..."
git push origin main

echo "Done! Visit your site at: https://shuruws.github.io/jotsNdots/" 