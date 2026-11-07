# WSL

## List Installed Distros

```powershell
wsl -l
wsl --list
```

## List Available Distros

```powershell
wsl --list --online
```

## Install a Distro
```powershell
wsl --install -d <DistoName>
```

## Remove a Distro
```powershell
wsl --unregister <DisroName>
```

## Set Default Distro

```powershell
wsl --set-default <DistroName>
```

## Launch a Specific Distro

```powershell
wsl -d <DistroName>
```
