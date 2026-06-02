# Proxmox

## Cluster
**Reference:**  
https://pve.proxmox.com/pve-docs/chapter-pvecm.html#_qdevice_net_setup

### Members
- **PVE.home** [192.168.2.22] - HP ProdDesk ??? G?
- **PVE2.home** [192.168.2.44] - HP ProdDesk 600 G4
- **OMV.home** [192.169.2.19] - RPi 4 Model B Rev 1.1 4Gb

## Backups
### ERROR: Backup of VM ### failed - VM is locked (backup)
**For Containers (lxc)**  
```
pct unlock #vmID#
```

**For Virtual Machines (vm)**  
```
qm unlock #vmID#
```


_Last updated: 2026-05-09_