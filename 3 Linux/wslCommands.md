
# 🐧 WSL (Windows Subsystem for Linux) – Most Useful Commands

This README is a **quick reference guide** for the most commonly used **WSL commands**, especially useful for **DevOps & Linux beginners on Windows**.

---

## 📌 What is WSL?
WSL allows you to run a **Linux environment directly on Windows** without dual boot or a full virtual machine.

---

## 🧭 Important Rule (Must Remember)
- ✅ Run **WSL commands** in **PowerShell / CMD**
- ✅ Run **Linux commands** inside **Ubuntu (WSL terminal)**

---

## 🔍 Check WSL Status & Info

### Check WSL status
```powershell
wsl --status

```

### Check WSL version

```powershell
wsl --version

```

----------

## 📦 List WSL Images (Distributions)

### List installed distros

```powershell
wsl -l

```

### List installed distros with details

```powershell
wsl -l -v

```

👉 `*` indicates the **default distro**

----------

## ▶️ Start WSL

### Start default distro

```powershell
wsl

```

### Start a specific distro

```powershell
wsl -d Ubuntu

```

----------

## 🔄 Set / Change Default Distro

```powershell
wsl --set-default Ubuntu

```

----------

## ⏹️ Stop WSL

### Stop all WSL instances

```powershell
wsl --shutdown

```

### Stop a specific distro

```powershell
wsl -t Ubuntu

```

----------

## 📥 Install / Manage Distros

### List available distros online

```powershell
wsl --list --online

```

### Install Ubuntu

```powershell
wsl --install -d Ubuntu

```

### Uninstall a distro

```powershell
wsl --unregister Ubuntu

```

⚠️ This deletes all Linux files of that distro.

----------

## 🐧 Useful Linux Commands (Inside Ubuntu)

### Check Linux version

```bash
uname -a

```

### Check Ubuntu version

```bash
lsb_release -a

```

### Go to home directory

```bash
cd ~

```

### Update packages

```bash
sudo apt update && sudo apt upgrade -y

```

----------

## 📁 File System Mapping

Location

Meaning

`/home/username`

Linux home (recommended work area)

`/mnt/c`

Windows C drive

`/mnt/c/Users`

Windows user files

⚠️ **Avoid working in `/mnt/c` for DevOps projects** (slow & permission issues)

----------

## 🐳 WSL + Docker (Important)

-   Docker Desktop uses **WSL2**
    
-   `docker-desktop` appears as a WSL distro
    
-   Keep **Ubuntu as default** for learning
    

----------

## 🧠 Best Practices

-   Use `/home/username` for Linux work
    
-   Run WSL commands only in PowerShell
    
-   Use WSL2 (recommended)
    
-   Shutdown WSL if system feels slow
    

----------

## 📌 Quick Cheat Sheet

Task

Command

List distros

`wsl -l -v`

Start WSL

`wsl`

Start Ubuntu

`wsl -d Ubuntu`

Stop all

`wsl --shutdown`

Set default

`wsl --set-default Ubuntu`

Install Ubuntu

`wsl --install -d Ubuntu`

----------

