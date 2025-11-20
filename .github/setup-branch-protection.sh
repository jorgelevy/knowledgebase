#!/bin/bash

# Branch Protection Setup Script
# This script helps automate the setup of branch protection rules for the main branch

set -e

REPO_OWNER="jorgelevy"
REPO_NAME="knowledgebase"
BRANCH_NAME="main"
CONFIG_FILE=".github/branch-protection.json"

echo "=================================="
echo "Branch Protection Setup Script"
echo "=================================="
echo ""
echo "Repository: ${REPO_OWNER}/${REPO_NAME}"
echo "Branch: ${BRANCH_NAME}"
echo ""

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ Error: GitHub CLI (gh) is not installed."
    echo ""
    echo "Please install it from: https://cli.github.com/"
    echo ""
    echo "Installation commands:"
    echo "  macOS:   brew install gh"
    echo "  Linux:   sudo apt install gh  (or snap install gh)"
    echo "  Windows: winget install --id GitHub.cli"
    echo ""
    exit 1
fi

# Check if user is authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Error: Not authenticated with GitHub CLI."
    echo ""
    echo "Please run: gh auth login"
    echo ""
    exit 1
fi

echo "✅ GitHub CLI is installed and authenticated"
echo ""

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Error: Config file not found: $CONFIG_FILE"
    exit 1
fi

echo "📋 Branch protection configuration:"
cat "$CONFIG_FILE"
echo ""

# Confirm before proceeding
read -p "Do you want to apply this branch protection configuration? (yes/no): " -r
echo ""

if [[ ! $REPLY =~ ^[Yy]es$ ]]; then
    echo "❌ Operation cancelled."
    exit 0
fi

echo "🔄 Applying branch protection rules..."
echo ""

# Apply branch protection using the GitHub API
gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "/repos/${REPO_OWNER}/${REPO_NAME}/branches/${BRANCH_NAME}/protection" \
  --input "$CONFIG_FILE"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Branch protection rules successfully applied!"
    echo ""
    echo "The '${BRANCH_NAME}' branch is now protected with the following rules:"
    echo "  • Require pull request before merging"
    echo "  • Require at least 1 approval"
    echo "  • Dismiss stale reviews when new commits are pushed"
    echo "  • Require status checks to pass (build)"
    echo "  • Require branches to be up to date before merging"
    echo "  • Require conversation resolution before merging"
    echo "  • Require linear history"
    echo "  • Enforce rules for administrators"
    echo "  • Disallow force pushes"
    echo "  • Disallow branch deletion"
    echo ""
    echo "You can view the protection rules at:"
    echo "https://github.com/${REPO_OWNER}/${REPO_NAME}/settings/branches"
else
    echo ""
    echo "❌ Failed to apply branch protection rules."
    echo "Please check your permissions and try again."
    echo ""
    echo "You may need to apply the rules manually via GitHub UI:"
    echo "https://github.com/${REPO_OWNER}/${REPO_NAME}/settings/branches"
    exit 1
fi
