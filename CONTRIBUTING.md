# Contributing Guide

Thank you for your interest in contributing to this knowledge base! This document outlines the process for contributing to ensure code quality and maintain repository standards.

## 🔒 Branch Protection

This repository uses branch protection rules. The `main` branch only accepts changes through pull requests. Direct pushes are not allowed.

## 📝 Contribution Workflow

### 1. Fork or Branch

If you're a collaborator:
```bash
# Clone the repository
git clone https://github.com/jorgelevy/knowledgebase.git
cd knowledgebase

# Create a new branch
git checkout -b feature/your-feature-name
```

If you're an external contributor:
- Fork the repository on GitHub
- Clone your fork locally
- Create a feature branch

### 2. Make Your Changes

- Add or modify blog posts in `_posts/`
- Update configuration in `_config.yml` if needed
- Add images to `assets/` directory
- Follow the existing code style and formatting

### 3. Test Your Changes Locally

```bash
# Install dependencies (first time only)
bundle install

# Run Jekyll locally
bundle exec jekyll serve

# Open http://localhost:4000 in your browser
```

Verify that:
- Your changes render correctly
- No broken links
- Images load properly
- Navigation works as expected

### 4. Commit Your Changes

Write clear, descriptive commit messages:

```bash
git add .
git commit -m "Add blog post about Docker best practices"
```

Good commit message examples:
- `Add blog post: Getting Started with Kubernetes`
- `Fix: Correct typo in Node.js tutorial`
- `Update: Improve Jekyll installation guide`
- `Docs: Add troubleshooting section to README`

### 5. Push to Your Branch

```bash
git push origin feature/your-feature-name
```

### 6. Create a Pull Request

1. Go to the repository on GitHub
2. Click "Compare & pull request" button
3. Fill in the PR template:
   - **Title**: Brief description of changes
   - **Description**: Detailed explanation of what and why
   - **Related Issues**: Link any related issues
4. Request review from maintainers
5. Wait for CI/CD checks to pass

### 7. Address Review Feedback

- Respond to comments
- Make requested changes
- Push updates to the same branch
- Request re-review when ready

### 8. Merge

Once approved and all checks pass, a maintainer will merge your PR.

## 📋 Pull Request Checklist

Before submitting your PR, ensure:

- [ ] Code follows the existing style
- [ ] Changes have been tested locally
- [ ] Commit messages are clear and descriptive
- [ ] PR description explains what and why
- [ ] No broken links or images
- [ ] Jekyll builds successfully
- [ ] No merge conflicts with main branch

## 🎨 Content Guidelines

### Blog Posts

New blog posts should be placed in `_posts/` with the naming format:
```
YYYY-MM-DD-title-of-post.md
```

Example:
```
2024-11-06-docker-networking-basics.md
```

### Frontmatter Template

```yaml
---
title: "Your Post Title"
date: YYYY-MM-DD HH:MM:SS +/-TTTT
categories: [Category1, Category2]
tags: [tag1, tag2, tag3]
---
```

### Writing Style

- Use clear, concise language
- Include code examples where applicable
- Add screenshots or diagrams for complex topics
- Proofread for grammar and spelling
- Use proper markdown formatting

## 🚫 What Not to Do

- ❌ Don't push directly to main (it's protected anyway)
- ❌ Don't include large binary files
- ❌ Don't commit credentials or sensitive information
- ❌ Don't copy copyrighted content without permission
- ❌ Don't make unrelated changes in the same PR

## 🐛 Reporting Issues

Found a bug or have a suggestion?

1. Check if an issue already exists
2. Open a new issue with a descriptive title
3. Provide:
   - Description of the issue
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots if applicable
   - Environment details (OS, browser, etc.)

## 💬 Communication

- Use PR comments for code-specific discussions
- Use issues for bugs and feature requests
- Be respectful and constructive
- Follow the project's code of conduct

## 🔄 Keeping Your Branch Updated

If your branch gets behind main:

```bash
# Fetch latest changes
git fetch origin

# Rebase on main (preferred)
git rebase origin/main

# Or merge main into your branch
git merge origin/main

# Push updated branch (may need --force-with-lease if rebased)
git push origin feature/your-feature-name --force-with-lease
```

## 🛠️ Development Environment

### Prerequisites

- Ruby 3.x
- Bundler
- Git
- Text editor (VS Code recommended)

### Setup

```bash
# Install Ruby dependencies
bundle install

# Run development server
bundle exec jekyll serve --livereload

# Run with drafts visible
bundle exec jekyll serve --drafts
```

## 📚 Additional Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Chirpy Theme Guide](https://github.com/cotes2020/jekyll-theme-chirpy/wiki)
- [Markdown Guide](https://www.markdownguide.org/)
- [Branch Protection Setup](BRANCH_PROTECTION.md)

## 🙏 Thank You!

Your contributions help make this knowledge base better for everyone. We appreciate your time and effort!

## Questions?

If you have questions about contributing, feel free to:
- Open an issue
- Contact the maintainers
- Check existing documentation

Happy contributing! 🎉
