# Explorer

## Shell Extensions
```registry
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions

Computer\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Shell Extensions
```


## Useful Tips

### Open Explorer from the command line with file selected

```
explorer /select,$path 
Invoke-Expression "explorer '/select,$path'"
```

