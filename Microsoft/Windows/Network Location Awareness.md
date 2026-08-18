# Network Location Awareness


## Troubleshooting

### Domain joined server keeps setting the network profile to PUBLIC
The Network location service is starting before the network is ready or the domain controller is not able to respond to the request sent from NLA, causing the service to default to the public profile.  
#### Solution:
Force NLA to keep checking for a Domain Controller

```registry
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters
```

Add a DWORD parameter ```AlwaysExpectDomainController``` and set value to ``` 1 ```

**Note:**  
This registry key alters the behavior when NLA retries domain detection.
