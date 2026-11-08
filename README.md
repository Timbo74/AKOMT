<img alt="image" src="https://github.com/user-attachments/assets/36ef1733-0b3a-493e-9115-a36ff9249c28" />

This is my attempt to document my learnings of all things nerdy, technical and fun.

## Obsidian
[Obsidian App](https://obsidian.md/)
### Plugins
- Git: [GitHub](https://github.com/vinzent03/obsidian-git)
- Script Viewer: [GitHub](https://github.com/viggomeesters/obsidian-script-viewer)
### Shortcuts

| Action                                             | Shortcut           |
| -------------------------------------------------- | ------------------ |
| Git: Commit-and-sync                               | `Ctrl + Shift + C` |
| Show Source Control (Git) tab in the right sidebar | `Ctrl + Shift + G` |
| Show file outline tab in the right sidebar         | `Ctrl + Shift + O` |
| Toggle left sidebar                                | `Alt + Shift + ←`  |
| Toggle right sidebar                               | `Alt + Shift + →`  |

## GitHub
https://github.com/Timbo74/AKOMT
### Clone Repository into current folder

```powershell
git clone git@github.com:Timbo74/AKOMT.git
```

### Push to Repository

```powershell
git add .
git commit -m "cleaned up folders"
git push
```

One liner:

```powershell
git add . && git commit -m "cleaned up folders" && git push
```

### Updates
6/11/2026 - Added notes for the Obsidian app.
5/11/2026 - Added ```.gitignore``` to ignore ```/.obsidian``` path if it is present.
