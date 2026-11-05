# PowerShell

**Reference:**
 - https://learn.microsoft.com/en-au/powershell/

## Environment Variables

### TL;DR
```powershell
# get the value
$currentuser = $env:username

# set the value
$env:username = "newusername"

#delete the value
$env:username = $null
```


### Getting Environment Variables

#### $env Method
Using ```$env:variablename``` will return the value only of the environment variable.  This can only be used to retrieve the value of a single environment variable.

```powershell
# return the value of an environment variable
$currentuser = $env:username
```

#### Get-ChildItem Method
This method returns enviroment variables in a key/value pair, and can alos be used to return a list of environment variables.

Any alias commands of ```Get-ChildItem``` can be used in the examples below ```gci```, ```ls``` and ```dir``` also work.

```powershell
$currentuser = Get-ChildItem env:username
# to return the value only
$currentuser = Get-ChildItem (env:username).value

# list all
Get-ChildItem env:

# list using wildcards
Get-ChildItem env:prog*
```

### Setting Environment Variables
```powershell
# set a temporary environment variable, this is not stored between sessions
SetEnvironmentVariable('VariableName', 'Value')

# set an environment variable for the current user
SetEnvironmentVariable('VariableName', 'Value', 'User')

# set an environment variable for the current machine
SetEnvironmentVariable('VariableName', 'Value', 'Machine')
```

### Removing Environment Variables
Set the value to ```$null```, or use the ```Remove-Item``` cmdlet to remove the variable.

```powershell
# set the variable to $null
$env:UserPrincipalName = $null

# or use the Environment provider
Set-Item -Path Env:\UserPrincipalname -Value $null

# using the Remove-Item cmdlet
Remove-Item -Path Env:\UserPrincipalname
```

## Handy Scripts
```powershell
# get the PATH environment variable as a list
$env:path –split ‘;’

# adding a new path to the env:Path variable
$env:Path += ';d:\scripts'
```
