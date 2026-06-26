# Links & Junctions

Reference:
 - Microsoft Learn: [Hard links and Junctions](https://learn.microsoft.com/en-us/windows/win32/fileio/hard-links-and-junctions)

## Comparison at a Glance

| Feature | Hard Link | Junction | Symbolic Link |
| --- | --- | --- | --- |
| Applies to: | Files only | Folders only | Both Files and Folders |
| Cross-Drive? | No (Same volume only) | Yes | Yes |
| Network Paths? | No | No | Yes |
| Target Moved/Deleted: | Link keeps working | Link breaks | Link breaks |

## Terminal

Documentation for [mklink](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink) tool.

**Symbolic Link** to Folder: 

```bat
mklink /d "C:\Path\To\SymlinkFolder" "D:\Actual\Target\Folder"
```

**Symbolic Link** to File:

```bat
mklink "C:\Path\To\SymlinkFile.txt" "D:\Actual\Target\File.txt"
```

**Hard Link** to File:

```bat
mklink /h "C:\Path\To\SymlinkFile.txt" "D:\Actual\Target\File.txt"
```

**Junction Point** to Folder:

```bat
mklink /j "C:\Path\To\JunctionFolder" "D:\Actual\Target\Folder"
```

## PowerShell

Documentation for [New-Item](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7.6) cmdlet.

**Symbolic Link** to Folder:

```powershell
New-Item -ItemType SymbolicLink -Path "C:\Path\To\SymlinkFolder" -Target "D:\Actual\Target\Folder"
```

**Symbolic Link** to File:

```powershell
New-Item -ItemType SymbolicLink -Path "C:\Path\To\Symlink.txt" -Target "D:\Actual\Target\File.txt"
```

**Hard Link** to File:

```powershell
New-Item -ItemType hardLink -Path "C:\Path\To\Symlink.txt" -Target "D:\Actual\Target\File.txt"
```

**Junction Point** to Folder:

```powershell
New-Item -ItemType Junction -Path "C:\Path\To\JunctionFolder" -Target "D:\Actual\Target\Folder"
```

