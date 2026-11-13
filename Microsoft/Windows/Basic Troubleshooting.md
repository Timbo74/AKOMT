# Troubleshooting

## Basic Toolkit

Grouping together some of the most commonly used commands.  More details and options can be found in the relevant sections below.

```powershell
Get-Service -Name <string>
Start-Service -Name <string>
Stop-Service -Name <string>
```

```powershell
Get-NetIPInterface
```

```powershell
Test-NetConnection -ComputerName venkman.home -Port 443 
```

Get Serial Number 
```PowerShell
Get-CimInstance Win32_BIOS
Get-CimInstance Win32_BIOS | Select-Object SerialNumber
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

## Hardware
### Display
Restart the graphics driver: 
Press `Windows Key + Ctrl + Shift + B` simultaneously.
## Networking

### List Network Interfaces
```powershell
Get-NetIPInterface

ifIndex InterfaceAlias                  AddressFamily...
------- --------------                  -------------...
22      Ethernet 9                      IPv6...
13      Ethernet 5                      IPv6...
29      Local Area Connection* 2        IPv6...
3       OpenVPN Data Channel Offload    IPv6...
5       Bluetooth Network Connection    IPv6...
```

### Get IP Addresses
```powershell
Get-NetIPAddress | Where {$_.AddressFamily -eq "IPv4"}
Get-NetIPAddress | Where {$_.IPAddress -like "192.*"}
```

### Test Network Connections
#### -Port Method
```powershell
Test-NetConnection -ComputerName venkman.home -Port 443
Test-NetConnection -ComputerName venkman.home -Port 443 -ConstrainInterface <ifIndex>
```
#### -CommonTCPPort Method
```powershell
Test-NetConnection -ComputerName venkman.home -CommonTCPPort HTTP
Test-NetConnection -ComputerName venkman.home -CommonTCPPort RDP
Test-NetConnection -ComputerName venkman.home -CommonTCPPort SMB
Test-NetConnection -ComputerName venkman.home -CommonTCPPort WINRM
```
