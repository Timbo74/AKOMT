# WinBEAT

## Silent Installs

### Create the answer file

```
setup.exe /r /f1"c:\temp\winbeat.iss"
```

### Run setup with the answer file
```
setup.exe /s /f1"c:\temp\winbeat\winbeat.iss" /f2"c:\temp\winbeat\winbeat.log"
```
