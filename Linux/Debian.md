# Users 

### Create user 
```
adduser 
```

### Change Password 
```
passwd 
```

### Add User To Sudo 
```
usermod -aG sudo username 
```

# Upgrade Debian 

### 1. Update Existing 
```
sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 
sudo apt autoremove --purge -y 
```

### 2. Edit Repository Sources 
```
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list 
sudo apt update 
```

### 3. Minimal System Upgrade 
```
sudo apt upgrade --without-new-pkgs 
```

### 4. Full Upgrade 
```
sudo apt full-upgrade -y 
```

### 5. Finalize & Reboot 
```
sudo apt autoremove 
sudo systemctl reboot 
```

### 6. Verify Upgrade 
```
hostnamectl 
cat /etc/os-release 
```

# Miscellaneous
## Errors
###  Error: ping: => missing cap_net_raw+p capability or setuid? 
```
sudo setcap cap_net_raw+p /usr/bin/ping
```