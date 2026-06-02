# Keychron Keyboards
Use VIA Website: https://usevia.app

## VIA: Editing Keys
Make sure to edit layer 2.

## UseVIA.app Error messages
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

```
sudo chown $USER:$USER /dev/hidraw*
```

