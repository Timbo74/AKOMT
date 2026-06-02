# SSH

## Generate a key on the client PC 
```
ssh-keygen 
```
## Copy the public key to the remote PC 
```
ssh-copy-id user@server.host.name 
```
or 
```
ssh-copy-id -i <path to pub cert file> user@server.host.name 
```
## Notes 
```
chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys 
```