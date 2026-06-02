# Overview
*Reference*
https://learn.microsoft.com/en-us/windows/package-manager/

# Install
`winget install AppID --version VersionNumber`

# List

## List installed apps
```
winget list
```

## Identify apps with pending updates
```
winget list --upgrade-available
```

# Show

## Show app versions
```
winget show AppId --versions
```

# Pin

## Pin to a specific version:
```
winget pin add --id AppID --version VersionNumber
```

## Pin currently installed version:
```
winget pin add --id AppID --installed
```

## View all active pins:
```
winget pin list
```

## Remove a pin
```
winget pin remove --id AppID
```
