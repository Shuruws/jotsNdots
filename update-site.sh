#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Hugo is installed
if ! command_exists hugo; then
    echo -e "${RED}Error: Hugo is not installed!${NC}"
    echo "Please install Hugo first:"
    echo "brew install hugo  # for macOS"
    exit 1
fi

# Check if this is a Hugo site
if [ ! -f "hugo.toml" ] && [ ! -f "config.toml" ]; then
    echo -e "${GREEN}Creating new Hugo site for jotsNdots...${NC}"
    
    # Create new Hugo site
    hugo new site . --force
    
    # Install PaperMod theme
    git init
    git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
    
    # Create basic hugo.toml configuration
    cat > hugo.toml << EOL
baseURL = "https://shuruws.github.io/jotsNdots/"
languageCode = "en-us"
title = "My Jots and Dots"
theme = "PaperMod"

enableRobotsTXT = true
buildDrafts = false
buildFuture = false
buildExpired = false

[minify]
disableXML = true
minifyOutput = true

[params]
env = "production"
title = "My Jots and Dots"
description = "A collection of my thoughts, learnings, and adventures in the twenties."
keywords = ["Blog", "ideas", "fun tech"]
author = "Shuru"
DateFormat = "January 2, 2006"
defaultTheme = "auto"
disableThemeToggle = false

[params.homeInfoParams]
Title = "Heyo, welcome to Shuru's jots and dots👋"
Content = """
    Kinda strange to introduce myself, so I'll skip that. You can get to know me by tone and words.
    I got dull and a little unmotivated working remotely, so I am trying to write for fun and get sharp again.
    This is my notepad for a scanvenger's hunt for passion.
    """

[[params.socialIcons]]
name = "github"
url = "https://github.com/Shuruws"

[[params.socialIcons]]
name = "linkedin"
url = "https://www.linkedin.com/in/shuru-wang-0a5101237/"
EOL

    echo -e "${GREEN}Basic site configuration created!${NC}"
    echo "Please edit hugo.toml to customize further if needed."
fi

# Create public directory if it doesn't exist
if [ ! -d "public" ]; then
    mkdir public
fi

# Clean the public directory
echo -e "${GREEN}Cleaning previous build...${NC}"
rm -rf public/*

# Build the Hugo site
echo -e "${GREEN}Building site...${NC}"
hugo

# Git operations
echo -e "${GREEN}Updating Git repository...${NC}"
git add .

# Create a commit with timestamp
commit_message="Site updated: $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$commit_message" || echo -e "${RED}No changes to commit${NC}"

# Push changes to remote repository
if git remote | grep -q "origin"; then
    echo -e "${GREEN}Pushing to GitHub Pages...${NC}"
    git push origin main || echo -e "${RED}Push failed. Please check your GitHub configuration${NC}"
else
    echo -e "${RED}No remote repository configured.${NC}"
    echo "To push to GitHub, run:"
    echo "git remote add origin https://github.com/Shuruws/jotsNdots.git"
    echo "git push -u origin main"
fi

echo -e "${GREEN}✨ Site updated and deployed successfully!${NC}"
echo -e "${GREEN}Visit your site at: https://shuruws.github.io/jotsNdots/${NC}" 