---
title: Git.- Sync Upstream
date: 2025-12-14 20:08:00 -700
categories: [Git]
tags: [git, github]     # TAG names should always be lowercase
---

```
git remote add upstream https://github.com/jorgelevy/chirpy-starter
git remote -v

git fetch upstream
git merge upstream/main --allow-unrelated-histories
```

## IA info

To update your forked Git repository with changes from the original (upstream) repository, follow these steps:

---

### 🛠 Step-by-Step: Sync Your Fork with the Original Repo

#### 1. **Add the original repo as a remote (if not already added)**
```bash
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPO.git
```
> Replace `ORIGINAL_OWNER/ORIGINAL_REPO` with the actual path of the original repository.

You can verify it with:
```bash
git remote -v
```

#### 2. **Fetch the latest changes from the original repo**
```bash
git fetch upstream
```

#### 3. **Merge the changes into your local branch**
If you're working on the `main` branch:
```bash
git checkout main
git merge upstream/main
```
> This merges the upstream changes into your local branch.

#### 4. **Push the updated branch to your fork on GitHub**
```bash
git push origin main
```

---

### 🧠 Tips for Clean Syncing

- If you want a **rebase** instead of a merge (to avoid merge commits):
  ```bash
  git checkout main
  git rebase upstream/main
  ```

- If your fork has diverged significantly, consider:
  ```bash
  git fetch upstream
  git reset --hard upstream/main
  git push origin main --force
  ```
  > ⚠️ This will overwrite your fork’s history—use with caution.

---

Let me know if you’re using a GUI like GitHub Desktop or VS Code—I can walk you through that too.

------------------------------------------------------------------------------------------

Absolutely, Jorge. That error—`refusing to merge unrelated histories`—means Git sees your fork and the upstream repo as having completely different roots, like two separate universes. It usually happens when:

- Your fork was initialized differently (e.g., with a README or license).
- The upstream repo has commits your fork doesn’t recognize as related.

Here’s how to resolve it safely:

---

### 🧰 Option 1: Merge with `--allow-unrelated-histories`
If you’re okay merging the histories (e.g., you trust the upstream and want to integrate it):

```bash
git fetch upstream
git merge upstream/main --allow-unrelated-histories
```

> Replace `main` with the branch name if it’s different (e.g., `master`).

This tells Git: “Yes, I know these histories are unrelated—merge anyway.”

---

### 🧼 Option 2: Rebase or Reset (for clean sync)
If you want your fork to match upstream exactly and discard your local history:

#### ⚠️ This will overwrite your local changes. Use only if you’re sure.

```bash
git fetch upstream
git checkout main
git reset --hard upstream/main
git push origin main --force
```

---

### 🧪 Option 3: Create a new branch to test the merge
If you want to experiment first:

```bash
git checkout -b test-merge
git merge upstream/main --allow-unrelated-histories
```

Then inspect the result before pushing or merging into `main`.

---