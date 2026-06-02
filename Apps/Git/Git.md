# Repositories

git config --global user.email "coombes74.tc@gmail.com"
git config --global user.name "Tim Coombes"


## Creating a repo from an existing folder
Create repository in GitHub
 - do not add Readme.

From the Quick setup section, select SSH and replace ```git@github.com:Timbo74/bob.git``` below with the repository URL.
```
echo "# bob" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:Timbo74/bob.git
git push -u origin main
```
