# Debian

## Users 

### Create user 
```bash
adduser 
```

### Change Password 
```bash
passwd 
```

### Add User To Sudo 
```bash
usermod -aG sudo username 
```

## Upgrade Debian 

### 1. Update Existing 
```bash
sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 
sudo apt autoremove --purge -y 
```

### 2. Edit Repository Sources 
```bash
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list 
sudo apt update 
```

### 3. Minimal System Upgrade 
```bash
sudo apt upgrade --without-new-pkgs 
```

### 4. Full Upgrade 
```bash
sudo apt full-upgrade -y 
```

### 5. Finalize & Reboot 
```bash
sudo apt autoremove 
sudo systemctl reboot 
```

### 6. Verify Upgrade 
```bash
hostnamectl 
cat /etc/os-release 
```

## Networking

### Clear the DNS Resolver Cache
```bash
sudo resolvectl flush-caches
```

## Miscellaneous
### Errors
####  Error: ping: => missing cap_net_raw+p capability or setuid? 
```bash
sudo setcap cap_net_raw+p /usr/bin/ping
```
