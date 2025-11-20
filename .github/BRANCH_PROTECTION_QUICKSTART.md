# Quick Start: Branch Protection

## TL;DR - Protect Your Main Branch in 3 Steps

### Option 1: GitHub Web UI (Recommended for Beginners)

1. **Go to Settings**
   - Navigate to: `https://github.com/jorgelevy/knowledgebase/settings/branches`
   
2. **Add Protection Rule**
   - Click "Add rule" or "Add branch protection rule"
   - Branch name pattern: `main`
   - Enable: ✅ **Require a pull request before merging**
   - Enable: ✅ **Require approvals** (set to 1)
   - Enable: ✅ **Include administrators**
   
3. **Save**
   - Click "Create" or "Save changes"

**Done!** Your main branch now only accepts changes via pull requests.

### Option 2: Automated Setup with GitHub CLI

```bash
# 1. Install GitHub CLI if you haven't already
# Visit: https://cli.github.com/

# 2. Authenticate
gh auth login

# 3. Run the setup script
cd /path/to/knowledgebase
.github/setup-branch-protection.sh
```

### Option 3: Manual API Call

```bash
gh api repos/jorgelevy/knowledgebase/branches/main/protection \
  --method PUT \
  --input .github/branch-protection.json
```

## What This Does

- ❌ **Blocks** direct pushes to main
- ✅ **Requires** all changes to go through pull requests
- ✅ **Requires** at least 1 code review approval
- ✅ **Requires** status checks (CI/CD) to pass
- ✅ **Prevents** accidental deletion of the main branch
- ✅ **Prevents** force pushes that could rewrite history

## Workflow After Protection is Enabled

```bash
# ❌ This will now fail:
git checkout main
git commit -m "Direct commit"
git push origin main

# ✅ Do this instead:
git checkout -b feature/my-change
git add .
git commit -m "My change"
git push origin feature/my-change
# Then create a PR on GitHub
```

## Need More Details?

See the full guide: [BRANCH_PROTECTION.md](BRANCH_PROTECTION.md)

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "Protected branch update failed" | Expected! Create a PR instead |
| "You need admin access" | Contact repository owner/admin |
| Status checks failing | Fix the CI/CD issues before merging |
| Can't find Settings → Branches | You need admin permissions |

## Quick Links

- 🔒 [Branch Protection Settings](https://github.com/jorgelevy/knowledgebase/settings/branches)
- 📖 [Full Documentation](BRANCH_PROTECTION.md)
- 🔧 [GitHub CLI](https://cli.github.com/)
- 📚 [GitHub Docs](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
