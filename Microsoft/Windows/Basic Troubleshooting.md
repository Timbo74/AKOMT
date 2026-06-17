# Troubleshooting

## Basic Toolkit

Grouping together some of the most commonly used commands.  More details and options can be found in the relevant sections below.

```
Get-Service -Name <string>
Start-Service -Name <string>
Stop-Service -Name <string>
```
```
Get-NetIPInterface
```
```
Test-NetConnection -ComputerName venkman.home -Port 443 
```

## Event Logs

### Command Line

Terminal
```
wevtutil qe Microsoft-Windows-PrintService/Admin /f:text /c:50
```

PowerShell
```powershell

```

## Registry Keys


## Services
```powershell
Get-Service -Name <string>

Start-Service -Name <string>
Stop-Service -Name <string>
```

## Networking

### List Network Interfaces
```powershell
Get-NetIPInterface
```

### Get IP Addresses
```powershell
Get-NetIPAddress | Where {$_.AddressFamily -eq "IPv4"}

Get-NetIPAddress | Where {$_.IPAddress -like "192.*"}
```

### Test Network Connections
Test-NetConnection -ComputerName <string> -Port <port#> [-InformationLevel <Detailed | Quiet>] [-ConstrainInterface <ifIndex>]
```powershell
Test-NetConnection -ComputerName venkman.home -Port 443 
```

**Test-NetConnection** **-ComputerName** *string* **-CommonTCPPort** <HTTP | RDP | SMB | WINRM> [**-InformationLevel** *<Detailed | Quiet>*] [**-ConstrainInterface** *ifIndex*]
```powershell
Test-NetConnection -ComputerName venkman.home -CommonTCPPort HTTP
```
