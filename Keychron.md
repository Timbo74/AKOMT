# Keychron Keyboards
Keychron Launcher: https://launcher.keychron.com/

Q1 Ultra 8K Wireless Silk POM Banana Switch
Q11 QMK Custom Mechanical Keyboard
# VIA App
Use VIA Website: https://usevia.app

## Editing Keys
Make sure to edit layer 2 for default key bindings, and edit layer 3 for the `fn + key` bindings. 

## Troubleshooting
```
NotAllowedError: Failed to open the device.
Device: Keychron Keychron Q11
Vid: 0x3434
Pid: 0x01E0
17:31:01.047
Received invalid protocol version from device
Device: Keychron Keychron Q11
Vid: 0x3434
Pid: 0x01E0
```
Then run the following: 

```bash
sudo chown $USER:$USER /dev/hidraw*
```

