
# 🔧 Git Commands Cheat Sheet – Complete Reference for DevOps

This document lists **all commonly used Git commands** with:
- Direct usage
- Very short explanation
- Real DevOps relevance

---

## 📦 Repository Setup

```bash
git init

```

Initialize a new Git repository

```bash
git clone <repo-url>

```

Clone a remote repository locally

----------

## 📂 File Status & Tracking

```bash
git status

```

Show working directory status

```bash
git add <file>

```

Stage a file

```bash
git add .

```

Stage all changes

```bash
git rm <file>

```

Remove file and stage deletion

```bash
git mv old new

```

Rename or move file

----------

## 📝 Commit Commands

```bash
git commit -m "message"

```

Commit staged changes

```bash
git commit -am "message"

```

Add & commit tracked files

```bash
git commit --amend

```

Edit last commit

----------

## 📜 History & Logs

```bash
git log

```

Show commit history

```bash
git log --oneline

```

Compact commit history

```bash
git show <commit>

```

Show commit details

```bash
git diff

```

Show unstaged changes

```bash
git diff --staged

```

Show staged changes

----------

## 🌿 Branching

```bash
git branch

```

List branches

```bash
git branch <name>

```

Create new branch

```bash
git checkout <branch>

```

Switch branch

```bash
git checkout -b <branch>

```

Create & switch branch

```bash
git switch <branch>

```

Switch branch (new syntax)

```bash
git branch -d <branch>

```

Delete branch

----------

## 🔀 Merging & Rebasing

```bash
git merge <branch>

```

Merge branch into current

```bash
git rebase <branch>

```

Reapply commits on another base

```bash
git rebase --abort

```

Cancel rebase

----------

## ⚔️ Conflict Handling

```bash
git status

```

Identify conflicted files

```bash
git add <file>

```

Mark conflict as resolved

```bash
git commit

```

Complete merge

----------

## ⏪ Undo & Recovery

```bash
git restore <file>

```

Discard local file changes

```bash
git restore --staged <file>

```

Unstage file

```bash
git reset HEAD <file>

```

Unstage file (old way)

```bash
git reset --soft HEAD~1

```

Undo commit (keep changes)

```bash
git reset --hard HEAD~1

```

Undo commit + changes (dangerous)

```bash
git reflog

```

Recover lost commits

----------

## 🌐 Remote Repositories

```bash
git remote -v

```

List remotes

```bash
git remote add origin <url>

```

Add remote repository

```bash
git fetch origin

```

Fetch remote changes

```bash
git pull origin main

```

Fetch + merge changes

```bash
git push origin main

```

Push commits to remote

```bash
git push -u origin main

```

Set upstream branch

----------

## 🔑 Tags & Releases

```bash
git tag

```

List tags

```bash
git tag v1.0

```

Create tag

```bash
git push origin v1.0

```

Push tag to remote

----------

## 🔐 Stash (Temporary Storage)

```bash
git stash

```

Save changes temporarily

```bash
git stash list

```

List stashes

```bash
git stash pop

```

Apply & remove stash

```bash
git stash drop

```

Delete stash

----------

## 🧹 Cleanup & Maintenance

```bash
git clean -f

```

Remove untracked files

```bash
git gc

```

Optimize repository

----------

## ⚙️ Configuration

```bash
git config --global user.name "Name"

```

Set username

```bash
git config --global user.email "email"

```

Set email

```bash
git config --list

```

View configuration

----------

## 📁 .gitignore

```bash
touch .gitignore

```

Ignore files from tracking

----------

## 🧠 Advanced Git

```bash
git cherry-pick <commit>

```

Apply specific commit

```bash
git blame <file>

```

Show who changed lines

```bash
git bisect

```

Find bug via binary search

----------

## 🚀 DevOps Daily Git Commands

```bash
git pull
git status
git add .
git commit -m "msg"
git push

```

----------

## 🎯 Interview Must-Remember

-   `git reflog` saves lives
    
-   Commits are snapshots
    
-   Branching is lightweight
    
-   Git is distributed
    
-   Never use `reset --hard` casually
    

----------

## 📌 Pro Tip

> If `.git` folder is deleted → Git is completely removed from the project.

