# PowerShell

## Installation & Updating

### Updating PowerShell

#### Manage Update Notification Behavior
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
