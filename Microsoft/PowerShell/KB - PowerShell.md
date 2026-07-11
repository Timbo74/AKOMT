# PowerShell

**Reference:**
 - https://learn.microsoft.com/en-au/powershell/

## Installation

**Reference:**
 - https://github.com/PowerShell/PowerShell

### On Windows
```powershell
winget search --id Microsoft.PowerShell --exact
winget install --id Microsoft.PowerShell --source winget
```

### On Ubuntu/Debian: 

```bash
sudo apt update
sudo apt install -y wget apt-transport-https software-properties-common

wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt update
sudo apt install -y powershell
```

### Installing the Common M365 Admin Stack

Windows & Linux
```powershell
Install-Module Microsoft.Graph -Scope CurrentUser -Force
Install-Module Microsoft.Entra -Scope CurrentUser -Force
Install-Module ExchangeOnlineManagement -Scope CurrentUser -Force
Install-Module PnP.PowerShell -Scope CurrentUser -Force
```

## Updating PowerShell

### On Windows
```
winget update --id Microsoft.PowerShell --source winget
```

### Manage Update Notification Behavior
```
 A new PowerShell stable release is available: v7.6.3
   Upgrade now, or check out the release page at:
     https://aka.ms/PowerShell-Release?tag=v7.6.3
```

You can change the behavior of the update notification by setting the ```POWERSHELL_UPDATECHECK``` environment variable. The following values are supported:

- ```Off``` turns off the update notification feature
- ```Default``` is the same as not defining POWERSHELL_UPDATECHECK:
  - GA releases notify of updates to GA releases
  - Preview/RC releases notify of updates to GA and preview releases
- ```LTS``` only notifies of updates to long-term-servicing (LTS) GA releases

**NOTE**: VSCode can be done with this setting ```"powershell.promptToUpdatePowerShell": false```.



## Command History / Autocomplete 

### Display History
```
(Get-PSReadLineOption).HistorySavePath
```
Will return the path to the history file "*ConsoleHost_history.txt*".
```
C:\Users\tim.coombes\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
```

### Edit History
```
notepad (Get-PSReadLineOption).HistorySavePath
```
### Autocomplete 
Pressing ```Control-Spacebar``` will display a list of autocomplete options.

```
PS C:\Users\tim.coombes> Get-ChildItem -{control-spacebar}
Path                 Depth                File                 ErrorAction          InformationVariable
LiteralPath          Force                Hidden               WarningAction        OutVariable
Filter               Name                 ReadOnly             InformationAction    OutBuffer
Include              Attributes           System               ProgressAction       PipelineVariable
Exclude              FollowSymlink        Verbose              ErrorVariable
Recurse              Directory            Debug                WarningVariable
```
