## Check Proxmox VE Version
```bash
# just the pve-manager version
pveversion

# versions of all packages
pveversion -v
```
# Containers
## Mount local folder to a container
This folder can be shared amongst multiple containers, be aware of possible file locking issues.
```bash
pct set 110 --mp1 /nvme-zfs/shared/media/,mp=/share/media
```
# Backups
## ERROR: Backup of VM ### failed - VM is locked (backup)
**For Containers (lxc)**  
```
pct unlock #vmID#
```

**For Virtual Machines (vm)**  
```
qm unlock #vmID#
```
