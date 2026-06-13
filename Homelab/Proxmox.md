# Proxmox

## Cluster

**Reference:** 
- https://pve.proxmox.com/pve-docs/chapter-pvecm.html#pvecm_create_cluster
- https://pve.proxmox.com/pve-docs/chapter-pvecm.html#_qdevice_net_setup

#### Members
- **PVE.home** [192.168.2.22] - HP ProdDesk ??? G?
- **PVE2.home** [192.168.2.44] - HP ProdDesk 600 G4
- **OMV.home** [192.169.2.19] - RPi 4 Model B Rev 1.1 4Gb

### Removing a Cluster

To revert a member of a cluster to a stand alone host.
Shut down the other nodes. This step is important to isolate the node from the rest of the cluster and avoid corosync or other services to copy back deleted files on the local node we're gonna act on.

Remove corosync config to ensure the node is no longer part of the cluster:
```bash
rm /etc/pve/corosync.conf
```

Clean up the cluster configuration:
```bash
rm -rf /etc/corosync/*
ls /etc/pve/nodes #show all nodes data in folders, delete the other nodes folders
rm -rf /etc/pve/nodes/<other_node_name> #just to be sure to delete data of other nodes
```

Reboot, just in case...

Verify the cluster has been removed:
- From the GUI in the menu on the left you should see only your node instead of all the nodes offline but the one you used to access the GUI 
- From the GUI go to `Datacenter > Cluster` and you should see sth like: "Standalone node - no cluster defined"
- run `pvecm status` and expected output is: `Error: Corosync config '/etc/pve/corosync.conf' does not exist - is this node part of a cluster?`

**Reference:** 
- https://www.reddit.com/r/Proxmox/comments/16268a2/how_to_delete_cluster_in_proxmox_8/

_Last updated: 2026-05-09_
