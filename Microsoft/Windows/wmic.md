# WMIC

## Get Serial Number 
```
wmic bios get serialnumber
```

PowerShell version

```powershell
Get-CimInstance Win32_BIOS

Get-CimInstance Win32_BIOS | Select-Object SerialNumber
```
