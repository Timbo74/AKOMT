# Applications
## .desktop Files

```
[Desktop Entry]
Name=Godot Engine
GenericName=Godot Engine
Exec=/home/tim/Apps/Godot/godot
Icon=godot
Terminal=false
Type=Application
StartupWMClass=Godot
```
### Finding the StartupWMClass
Run the app you want to find the **StartupWMClass** value for, press `alt-F2` then type `lg` to run the *looking glass* tool.  Then click on **Windows** tab and find the app and it's listed **StartupWMClass** value.

## File Locations
| File | Location |
| ---- | -------- |
| **.desktop** files (User) | `/home/<username>/.local/share/applications` |
| **.desktop** files (System) | `/usr/share/applications/Local/` |
| **.desktop** files Custom Installs | `/usr/local/share/applications/` |
| **.desktop** files Flatpak (User) | `~/.local/share/flatpak/exports/share/applications/` | 
| **.desktop** files Flatpak (System) | `/var/lib/flatpak/exports/share/applications/` |
| Icon files | `/home/<username>/.local/share/icons/hicolor/<resolution>/apps` |

Pro Tip: If you want to modify a system app, copy its .desktop file from `/usr/share/applications/` to `~/.local/share/applications/` and edit it there to avoid system changes being overwritten.

## 

# Files (Nautilus) 

## Open Files with a file selected 
```
nautilus -s /path/to/your/file 
```

# Terminal 

## Open an application in a new tab 
Tab will close when the app closes 
```
gnome-terminal --tab -- "<command-goes-here>" 
```
To keep the tap open, launch your shell and then the command. 
```
gnome-terminal --tab -- bash -c "<command-goes-here>" 
```

_Last updated: 2026-05-09_