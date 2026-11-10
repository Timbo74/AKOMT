![](https://github.com/user-attachments/assets/36ef1733-0b3a-493e-9115-a36ff9249c28)
This is my attempt to document my learnings of all things nerdy, technical and fun.
## Obsidian
[Obsidian App](https://obsidian.md/)
### Plugins
- Git: [GitHub](https://github.com/vinzent03/obsidian-git)
- Script Viewer: [GitHub](https://github.com/viggomeesters/obsidian-script-viewer)
### Hotkeys
Recommended only, these settings are not tracked in GitHub.

| Action                                        | Shortcut           |
| --------------------------------------------- | ------------------ |
| Git: Commit-and-sync                          | `Ctrl + Shift + C` |
| Git: Open source control view (right sidebar) | `Ctrl + Shift + G` |
| Outline: Show outline (right sidebar)         | `Ctrl + Shift + O` |
| Files: Show file explorer (left sidebar)      | `Ctrl + Shift + D` |
| Toggle left sidebar                           | `Alt + Shift + ←`  |
| Toggle right sidebar                          | `Alt + Shift + →`  |

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
- 6/11/2026 - Added notes for the Obsidian app.
- 5/11/2026 - Added ```.gitignore``` to ignore ```/.obsidian``` path if it is present.
- 10/11/2026 - Updated `.gitignore` to allow syncing of `bookmarks.json` & `hotkeys.json` in the `.obsidian` folder.