# Obsidian 

- https://obsidian.md/
- https://obsidian.md/help/
## Configuration
Linux - app settings
```
~.config/obsidian
```
Windows - app settings
```
%APPDATA%\Roaming\obsidian
```
Vault settings
```
<vault_folder>/.obsidian

PS C:\<vauilt_folder>\.obsidian> ls

    Directory: C:\<vault_folder>\.obsidian

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----           5/11/2026 10:21 AM                plugins
-a---           9/11/2026  9:26 AM              2 app.json
-a---           9/11/2026  9:26 AM              2 appearance.json
-a---           9/11/2026  9:27 AM            496 bookmarks.json
-a---           9/11/2026  9:27 AM             20 community-plugins.json
-a---           9/11/2026  9:26 AM            667 core-plugins.json
-a---           6/11/2026 10:10 AM            493 graph.json
-a---           9/11/2026  9:27 AM            420 hotkeys.json
-a---           9/11/2026  9:27 AM           6654 workspace.json
```
## Keyboard Shortcuts

| Action               | Windows / Linux    |
| -------------------- | ------------------ |
| **Quick Switcher**   | Ctrl + O           |
| **Command Palette**  | Ctrl + P           |
| **New Note**         | Ctrl + N           |
| **Toggle View**      | Ctrl + E           |
| **Bold**             | Ctrl + B           |
| **Italic**           | Ctrl + I           |
| **Insert Link**      | Ctrl + K           |
| **Global Search**    | Ctrl + Shift + F   |
| **Graph View**       | Ctrl + G           |
| **Undo**             | Ctrl + Z           |
| **Redo**             | Ctrl + Shift + Z   |
| **Close Tab**        | Ctrl + W           |
| **Reopen Tab**       | Ctrl + Shift + T   |
| **Navigate Back**    | Ctrl + Alt + Left  |
| **Navigate Forward** | Ctrl + Alt + Right |
## Notes 

### Git .gitignore 

```
# Ignore internal workspace configurations (avoids constant merge conflicts)
.obsidian/workspace.json
.obsidian/workspace-mobile.json

# Ignore community plugin caches if necessary
.obsidian/plugins/*/.cache/

# Ignore OS-specific metadata files
.DS_Store
Thumbs.db
```

