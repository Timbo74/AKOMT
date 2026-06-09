# Command History / Autocomplete 

## Display History
```
(Get-PSReadLineOption).HistorySavePath
```
Will return the path to the history file "*ConsoleHost_history.txt*".
```
C:\Users\tim.coombes\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
```

## Edit History
```
notepad (Get-PSReadLineOption).HistorySavePath
```
## Autocomplete 
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
