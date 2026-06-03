# Overview
*Reference*
https://learn.microsoft.com/en-us/windows/package-manager/

## Install

Installs the given package.

```
winget install AppID --version VersionNumber
```

## List

Display installed packages.

### List installed apps

```
winget list
```

### Identify apps with pending updates

```
winget list --upgrade-available
```

## Search

Find and show basic info of packages.

```
winget search <query>
```

## Show
Shows information about a package.

### Show app versions

```
winget show AppId --versions
```

## Pin

Manage package pins.  Allows you to pin an app to a specific version so that it won't be upgraded with a ```winget upgrade``` or ```winget install``` command.

### Pin to a specific version:

```
winget pin add --id AppID --version VersionNumber
```

### Pin currently installed version:

```
winget pin add --id AppID --installed
```

### View all active pins:

```
winget pin list
```

### Remove a pin

```
winget pin remove --id AppID
```
