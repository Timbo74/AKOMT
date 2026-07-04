# Rclone

**Reference:** 
 - https://rclone.org/

## TL;DR

Here's some known working scripts.

### Copy OneDrive to local 
```bash
rclone copy --progress --transfers 2 --onedrive-chunk-size 10M  --exclude "/Personal Vault/**" OneDrivePersonal: /local/destination/path
```

### Copy Pictures from OneDrive Personal to OneDrive Business
```bash
rclone copy --progress --transfers 2 --onedrive-chunk-size 10M --exclude "/Personal Vault/**" OneDrivePersonal:Pictures OneDriveBusiness:Pictures
```


## Install

- https://rclone.org/install/

```bash
sudo -v ; curl https://rclone.org/install.sh | sudo bash
```

## Copy

 - https://rclone.org/commands/rclone_copy/

```bash
rclone copy --progress source: remote:
```

## Sync
 - https://rclone.org/commands/rclone_sync/

```bash
rclone copy --progress source: remote:
```


## Configuring Remotes

### OneDrive Personal or Business

- https://rclone.org/onedrive/

Paths are specified as ```remote:path```

Paths may be as deep as required, e.g. ```remote:directory/subdirectory```.

```bash
rclone config
```

n new remote
enter name for new remote
Select Microsoft OneDrive (as of version xyz: option 42)

client_id <enter>
client_secret <enter>
region <Microsoft Cloud Global>
tenant <enter>
exit anvanced config <n>

Use web browser to automatically authenticate rclone with remote?
 * Say Y if the machine running rclone has a web browser you can use
 * Say N if running rclone on a (remote) machine without web browser access
If not sure try Y. If Y failed, try N.

y) Yes (default)
n) No

<y>

Login

For onedrive business you will need to grant consent

config_type <1>

config_driveid <1>

Found drive root <y>

Keep this remote <y>

### Troubleshooting

#### upload chunks may be taking too long - try reducing --onedrive-chunk-size or decreasing --transfers
```bash
rclone copy /path/to/local remote:folder --transfers 2 --onedrive-chunk-size 10M
```

### Personal Vault: error reading source directory:
```bash
--exclude "/Personal Vault/**"
```
