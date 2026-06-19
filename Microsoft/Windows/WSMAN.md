# WS Management

## Troubleshooting

### Server Manager Reports "Configuration refresh failed"

```
TARGET-SERVER-NAME: Configuration refresh failed with the following error: The WS-Managemen service cannot process the request.  The computed response packed size (####) exceeds the maximum envelope size that is (512000).
```

To confirm the current **Max Envelope Size** run the following:

```powershell
Get-Item WSMan:\localhost\MaxEnvelopeSizeKb
```

Should return something similar to the following:

```
   WSManConfig: Microsoft.WSMan.Management\WSMan::localhost

Type            Name                           SourceOfValue   Value
----            ----                           -------------   -----
System.String   MaxEnvelopeSizekb                              500
```

To increase the **Max Envelope Size** run the following: 

```powershell
Set-Item WSMan:\localhost\MaxEnvelopeSizekb 600
111
