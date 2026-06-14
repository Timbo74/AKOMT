# Git & Github

```text
https://github.com/Timbo74/
```

## Setup

```powershell
git config --global user.email "coombes74.tc@gmail.com"
git config --global user.name "Tim Coombes"
```

## Repositories

### Creating a repo from an existing folder

Create repository in GitHub

- do not add Readme.

From the Quick setup section, select SSH and replace ```git@github.com:Timbo74/bob.git``` below with the repository URL.

```powershell
echo "# Repository Title Goes Here" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:Timbo74/bob.git
git push -u origin main
```

# Git Commands

## Add

```bash
git add <pathspec>
```

### Add all files 

```bash
git add .
```

### Adding files from this folder only 
On Linux
```bash
git add $(find . -type f -maxdepth 1)
```

On Windows
```powershell
git add
```

## Clone

```bash
git clone <options> <repo> <dir>
```

Clone to current dir
```bash
git clone git@github.com:Timbo74/AKOMT.git
```



## Commit

```bash
git commit
```

## Init

```bash
git init
```

## Pull

```bash
git pull
```

## Push

```bash
git push
```

## Status

```bash
git status
```

