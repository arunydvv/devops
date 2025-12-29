
# 🔁 Version Control System (VCS) – Git & GitHub for DevOps Engineers

This guide covers **everything a DevOps engineer must know about Version Control Systems**,  
with deep focus on **Git (local VCS)** and **GitHub (remote collaboration platform)**.

---

## 📌 What is a Version Control System?

A Version Control System (VCS) tracks **changes in source code over time**, allowing multiple developers to:
- Work in parallel
- Maintain history
- Roll back changes
- Collaborate safely

---

## 🧠 Why VCS is CRITICAL for DevOps

- CI/CD pipelines start from Git
- Infrastructure as Code (Terraform, CloudFormation) lives in Git
- Auditing, rollback, and traceability depend on Git history
- Every deployment is linked to a commit

---

## 🧱 Types of Version Control Systems

### 1️⃣ Local VCS
- Tracks changes on a single machine
- Example: RCS

### 2️⃣ Centralized VCS (CVCS)
- Single central server
- Examples: SVN, CVS
- ❌ Single point of failure

### 3️⃣ Distributed VCS (DVCS) ✅
- Full repo copy on every machine
- Example: Git
- Offline work supported
- Fast and resilient

---

## 🐙 Git – Deep Fundamentals (MUST KNOW)

### What is Git?
Git is a **distributed version control system** created by Linus Torvalds for managing source code efficiently.

---

## 🧠 How Git Works Internally (IMPORTANT)

### Git has 3 main areas:
1. Working Directory
2. Staging Area (Index)
3. Local Repository (`.git` folder)

### Inside `.git` folder:
- `objects/` → stores commits, trees, blobs
- `refs/` → branches, tags
- `HEAD` → points to current branch
- `config` → repo configuration

📌 **Deleting `.git` removes version control completely**

---

## 📂 Git Object Model
- Blob → file content
- Tree → directory structure
- Commit → snapshot + metadata
- SHA-1 → unique hash ID

---

## 🔑 Core Git Concepts

- Repository
- Commit
- Branch
- HEAD
- Tag
- Remote
- Upstream
- Origin

---

## 🧪 Essential Git Commands (Hands-on)

### Repository Setup
```bash
git init
git clone <repo-url>

```

### File Lifecycle

```bash
git status
git add .
git commit -m "message"

```

### History & Inspection

```bash
git log
git show
git diff

```

----------

## 🌿 Branching (VERY IMPORTANT)

### Why Branches?

-   Isolate features
    
-   Safe experimentation
    
-   Parallel development
    

### Commands

```bash
git branch
git branch feature-1
git checkout feature-1
git switch main
git merge feature-1

```

### Merge Strategies

-   Fast-forward
    
-   3-way merge
    

----------

## ⚔️ Merge Conflicts

-   Occur when same lines are modified
    
-   Must be resolved manually
    
-   Common in large teams
    

----------

## ⏪ Undo & Recovery (CRITICAL SKILL)

### Safe Undo

```bash
git restore <file>
git reset --soft HEAD~1

```

### Dangerous (but powerful)

```bash
git reset --hard
git reflog

```

📌 **`git reflog` can save you from disaster**

----------

## 🧹 Git Clean & Maintenance

```bash
git clean -f
git gc

```

----------

## 🌐 GitHub – Remote Repository Platform

### What is GitHub?

GitHub is a **code hosting & collaboration platform** built around Git.

----------

## 🔗 Local Git ↔ GitHub Flow

```bash
git remote add origin <url>
git push -u origin main
git pull origin main

```

----------

## 🔐 Authentication

-   HTTPS (username + token)
    
-   SSH (recommended)
    
    -   `id_rsa` / `id_ed25519`
        
    -   Public key → GitHub
        
    -   Private key → Local machine
        

----------

## 🔁 Pull Requests (PRs)

-   Code review mechanism
    
-   CI/CD triggers
    
-   Approval workflow
    
-   Merge policies
    

----------

## 🏗️ GitHub Features (DevOps Focus)

### GitHub Actions (CI/CD)

-   YAML-based pipelines
    
-   Build, test, deploy
    
-   Integrates with AWS, Docker, K8s
    

### GitHub Issues

-   Bug tracking
    
-   Feature requests
    

### GitHub Projects

-   Agile boards
    

----------

## 🧠 Git Workflows (INTERVIEW FAVORITE)

### 1️⃣ Centralized Workflow

-   Single main branch
    

### 2️⃣ Feature Branch Workflow

-   Feature branches → PR → merge
    

### 3️⃣ Git Flow

-   main
    
-   develop
    
-   feature
    
-   release
    
-   hotfix
    

### 4️⃣ Trunk-Based Development (Modern DevOps)

-   Short-lived branches
    
-   Frequent commits to main
    

----------

## 📦 Git Tags & Releases

```bash
git tag v1.0
git push origin v1.0

```

Used for:

-   Versioning
    
-   Rollbacks
    
-   Production releases
    

----------

## 🛡️ Security & Best Practices

-   Never commit secrets
    
-   Use `.gitignore`
    
-   Enable branch protection
    
-   Require PR reviews
    
-   Enable secret scanning
    

----------

## 🧪 Hands-on Practice Projects

### Beginner

-   Create repo and push code
    
-   Branch and merge
    
-   Resolve merge conflict
    

### Intermediate

-   Fork & contribute
    
-   PR-based workflow
    
-   GitHub Actions CI pipeline
    

### Advanced

-   Git + Docker CI/CD
    
-   GitOps-style workflow
    
-   Rollback using tags
    

----------

## 🛠️ Practice Platforms

-   GitHub Learning Lab  
    [https://lab.github.com/](https://lab.github.com/)
    
-   Git Immersion  
    [https://gitimmersion.com/](https://gitimmersion.com/)
    
-   GitHub Actions Docs  
    [https://docs.github.com/actions](https://docs.github.com/actions)
    

----------

## ❓ Git & GitHub Interview Questions

### Basics

1.  What is Git?
    
2.  Git vs GitHub?
    
3.  What is commit?
    
4.  What is branch?
    

### Intermediate

5.  Git merge vs rebase
    
6.  What is HEAD?
    
7.  What is staging area?
    
8.  How do you resolve conflicts?
    

### Advanced

9.  What happens inside `.git`?
    
10.  What is reflog?
    
11.  Git Flow vs Trunk-based?
    
12.  How Git enables CI/CD?
    
13.  How do you recover lost commits?
    

----------

## 🧠 Interview One-Liners (Gold)

-   Git is distributed, not centralized
    
-   GitHub is not Git
    
-   Commits are snapshots, not diffs
    
-   Branching in Git is lightweight
    
-   Reflog is your safety net
    

----------

## 🎯 Final DevOps Expectation

After mastering Git & GitHub:

-   You can collaborate safely
    
-   You understand CI/CD triggers
    
-   You can debug Git issues
    
-   You can manage large-scale repos
    
-   You are DevOps production-ready
    

----------

🚀 **Next Step**

-   GitHub Actions
    
-   GitOps (ArgoCD / Flux)
    
-   Infrastructure as Code with Git

# ⚙️ GitHub Actions – CI/CD for DevOps Engineers (Complete Guide)

This guide explains **GitHub Actions from zero to production**, covering:
- CI/CD concepts
- Workflow architecture
- YAML syntax
- Real-world pipelines
- Docker & AWS deployments
- Interview preparation

---

## 📌 What is CI/CD?

### CI (Continuous Integration)
- Automatically build & test code
- Triggered on every push / PR
- Finds bugs early

### CD (Continuous Delivery / Deployment)
- Automatically deploy code
- Ensures fast & reliable releases

📌 **In DevOps:**  
Every commit should be **buildable, testable, deployable**.

---

## 🐙 What is GitHub Actions?

GitHub Actions is a **native CI/CD platform** provided by GitHub that allows you to:
- Automate workflows
- Build, test, and deploy code
- Trigger pipelines on Git events

📌 **CI/CD lives inside your GitHub repository**

---

## 🧠 GitHub Actions Architecture (VERY IMPORTANT)

### Core Components

| Component | Meaning |
|--------|--------|
| Workflow | YAML file defining automation |
| Event | Trigger (push, PR, schedule) |
| Job | Set of steps |
| Step | Individual command/action |
| Runner | Machine that runs jobs |
| Action | Reusable automation |

---

## 📂 Repository Structure


```

.github/  
└── workflows/  
└── ci-cd.yml

```

📌 **All workflows must live inside `.github/workflows/`**

---

## 🧾 Basic Workflow Syntax

```yaml
name: CI Pipeline

on:
  push:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      - name: Run a script
        run: echo "Hello CI"

```

----------

## 🔔 Workflow Triggers (Events)

```yaml
on:
  push
  pull_request
  workflow_dispatch
  schedule:
    - cron: "0 2 * * *"

```

Common triggers:

-   push
    
-   pull_request
    
-   manual trigger
    
-   scheduled (cron)
    

----------

## 🏃 Runners (Execution Machines)

### GitHub-hosted runners

-   ubuntu-latest
    
-   windows-latest
    
-   macos-latest
    

### Self-hosted runners

-   Used in enterprise
    
-   Installed on EC2 / on-prem servers
    

----------

## 🧩 Jobs & Steps (Execution Flow)

```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Install deps
        run: npm install

```

📌 Jobs run **in parallel by default**

----------

## 🔗 Job Dependencies

```yaml
jobs:
  build:
    runs-on: ubuntu-latest

  deploy:
    needs: build
    runs-on: ubuntu-latest

```

----------

## 🐳 GitHub Actions + Docker (VERY IMPORTANT)

### Build Docker Image

```yaml
- name: Build Docker image
  run: docker build -t myapp:latest .

```

### Push to Docker Hub

```yaml
- name: Login to DockerHub
  uses: docker/login-action@v3
  with:
    username: ${{ secrets.DOCKER_USERNAME }}
    password: ${{ secrets.DOCKER_PASSWORD }}

- name: Push image
  run: docker push myapp:latest

```

----------

## 🔐 Secrets & Environment Variables

### Add secrets:

GitHub Repo → Settings → Secrets → Actions

Use in workflow:

```yaml
env:
  DB_PASSWORD: ${{ secrets.DB_PASSWORD }}

```

📌 **Never hardcode secrets**

----------

## ☁️ GitHub Actions + AWS (REAL DEVOPS USE)

### Authenticate to AWS

```yaml
- name: Configure AWS
  uses: aws-actions/configure-aws-credentials@v4
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: ap-south-1

```

### Push Docker Image to ECR

```yaml
- name: Login to ECR
  run: aws ecr get-login-password | docker login --username AWS --password-stdin <account>.dkr.ecr.ap-south-1.amazonaws.com

```

----------

## 🚀 Deployment Strategies

### Common Deployment Types

-   Rolling Deployment
    
-   Blue-Green Deployment
    
-   Canary Deployment
    

📌 GitHub Actions can orchestrate **all of them**

----------

## 🧪 Example: Node.js CI Pipeline

```yaml
name: Node CI

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm install
      - run: npm test

```

----------

## 🧪 Example: Docker + AWS CI/CD Pipeline

Flow:

1.  Code push
    
2.  Build Docker image
    
3.  Push to ECR
    
4.  Deploy to EC2 / ECS
    

📌 **This is real DevOps production pipeline**

----------

## 🛡️ Security Best Practices

-   Use secrets, not env files
    
-   Enable branch protection
    
-   Require PR reviews
    
-   Use least privilege IAM
    
-   Scan Docker images
    
-   Use dependabot
    

----------

## 🧪 Hands-on Practice Projects

### Beginner

-   CI for Node/Python app
    
-   PR-based CI checks
    

### Intermediate

-   Docker build & push
    
-   Secrets management
    

### Advanced

-   AWS ECR + ECS deploy
    
-   Multi-environment pipeline
    
-   Blue-green deployment
    

----------

## ❓ GitHub Actions Interview Questions

### Basics

1.  What is GitHub Actions?
    
2.  What is a workflow?
    
3.  What are runners?
    

### Intermediate

4.  Job vs step?
    
5.  How secrets work?
    
6.  How do jobs communicate?
    

### Advanced

7.  GitHub Actions vs Jenkins?
    
8.  How to secure pipelines?
    
9.  How to deploy to AWS?
    
10.  How to rollback deployment?
    

----------

## 🧠 Interview One-Liners (Gold)

-   Pipelines are defined as code
    
-   Secrets never go into repos
    
-   CI should run on every PR
    
-   CD should be automated
    
-   GitHub Actions replaces Jenkins for many teams
    

----------

## 🎯 Final DevOps Outcome

After mastering GitHub Actions:

-   You can build CI/CD pipelines
    
-   You can deploy Docker apps
    
-   You can integrate AWS
    
-   You can automate everything
    
-   You are **DevOps job-ready**
    

----------

🚀 **Next Steps**

-   Jenkins
    
-   ArgoCD (GitOps)
    
-   Terraform + GitHub Actions
    
-   Kubernetes deployments
    

