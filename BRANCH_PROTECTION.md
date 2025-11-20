# Branch Protection Setup Guide

This guide provides instructions on how to protect your main branch to only accept changes through pull requests.

## Overview

Branch protection rules help ensure code quality and prevent accidental pushes directly to important branches like `main` or `master`. By requiring pull requests, you ensure that all changes go through proper review and testing.

## Setting Up Branch Protection via GitHub UI

### Step 1: Navigate to Repository Settings

1. Go to your repository on GitHub: `https://github.com/jorgelevy/knowledgebase`
2. Click on **Settings** (you need admin permissions)
3. In the left sidebar, click on **Branches** under the "Code and automation" section

### Step 2: Add Branch Protection Rule

1. Click the **Add rule** button (or **Add branch protection rule**)
2. In the "Branch name pattern" field, enter: `main`
   - You can also use patterns like `master` or `main*` to protect multiple branches

### Step 3: Configure Protection Rules

Enable the following recommended settings:

#### Required Settings for PR-Only Merges

- ✅ **Require a pull request before merging**
  - This is the core setting that prevents direct pushes
  - Optionally enable: **Require approvals** (recommended: at least 1 approval)
  - Optionally enable: **Dismiss stale pull request approvals when new commits are pushed**
  - Optionally enable: **Require review from Code Owners** (if you have a CODEOWNERS file)

#### Additional Recommended Settings

- ✅ **Require status checks to pass before merging**
  - Select status checks like CI/CD workflows (e.g., "Build and Deploy")
  - Enable: **Require branches to be up to date before merging**

- ✅ **Require conversation resolution before merging**
  - Ensures all review comments are addressed

- ✅ **Require signed commits** (optional but recommended for security)

- ✅ **Require linear history** (optional)
  - Prevents merge commits, enforces rebase or squash merging

- ✅ **Include administrators**
  - Apply these rules to repository administrators as well
  - Recommended to ensure consistency

#### Restrictions

- **Lock branch** - Makes the branch read-only (use with caution)
- **Do not allow bypassing the above settings** - Ensures rules cannot be bypassed
- **Allow force pushes** - Leave this DISABLED
- **Allow deletions** - Leave this DISABLED

### Step 4: Save Changes

1. Scroll down and click **Create** or **Save changes**
2. Your main branch is now protected!

## Setting Up Branch Protection via GitHub CLI

If you prefer automation, you can use the GitHub CLI (`gh`):

```bash
# Install GitHub CLI if needed
# https://cli.github.com/

# Authenticate
gh auth login

# Enable branch protection for main branch
gh api repos/jorgelevy/knowledgebase/branches/main/protection \
  --method PUT \
  --field required_pull_request_reviews[required_approving_review_count]=1 \
  --field required_pull_request_reviews[dismiss_stale_reviews]=true \
  --field enforce_admins=true \
  --field required_linear_history=true \
  --field allow_force_pushes=false \
  --field allow_deletions=false
```

## Setting Up Branch Protection via Terraform

For infrastructure-as-code approach:

```hcl
resource "github_branch_protection" "main" {
  repository_id = "knowledgebase"
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews          = true
  }

  enforce_admins = true
  require_signed_commits = false
  required_linear_history = true

  allows_deletions = false
  allows_force_pushes = false
}
```

## Verifying Branch Protection

After setting up protection, verify it works:

1. Try to push directly to main:
   ```bash
   git checkout main
   git commit --allow-empty -m "Test commit"
   git push origin main
   ```
   
   You should see an error like:
   ```
   remote: error: GH006: Protected branch update failed for refs/heads/main.
   ```

2. The correct workflow is now:
   ```bash
   # Create a new branch
   git checkout -b feature/my-changes
   
   # Make changes and commit
   git add .
   git commit -m "My changes"
   
   # Push to your branch
   git push origin feature/my-changes
   
   # Create a pull request via GitHub UI or CLI
   gh pr create --title "My changes" --body "Description"
   ```

## Best Practices

1. **Require at least 1 review** - Ensures code is reviewed before merging
2. **Enable status checks** - Ensure CI/CD passes before merging
3. **Include administrators** - Lead by example
4. **Require conversation resolution** - All feedback should be addressed
5. **Keep branch up to date** - Prevent merge conflicts

## Troubleshooting

### "You don't have permission to push to main"

This is expected behavior when branch protection is enabled. Create a pull request instead.

### "Status checks are failing"

Ensure your workflows (like `.github/workflows/pages-deploy.yml`) are passing before merging.

### "Need admin access to change settings"

Only repository administrators can modify branch protection rules. Contact the repository owner.

## Related Documentation

- [GitHub Branch Protection Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [Pull Request Best Practices](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests)
- [Code Review Guidelines](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests)

## Support

For questions or issues with branch protection setup, please open an issue in this repository or contact the repository administrator.
