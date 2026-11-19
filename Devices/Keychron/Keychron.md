


# Keychron Keyboards
Q1 Ultra 8K Wireless Silk POM Banana Switch
Q11 QMK Custom Mechanicals Keyboard
## Default Key Bindings
`fn + W` Increase backlight brightness.
`fn + S` Decrease backlight brightness.
`fn + Q` Change the lighting effect.
`fn + tab` toggle backlight on/off.

## Factory Reset & Firmware Update
### Factory Reset
1. Power on the keyboard.
2. Press and hold `fn + J + Z` for 4 seconds.  The keyboard backlight will flash in red quickly for 3 seconds indicating the keyboard has been reset. 
### Firmware Update
1. Visit launcher.keychron.com.
2. Ensure the keyboard is in Cable/Wired mode and plug in the cable.
3. Click 'Firmware Update' tab on the left side of the Launcher and connect your keybaord with it.
4. Follow the onscreen  instructions to update the firmware. 
## Editing Keys
Make sure to edit layer 2 for default key bindings, and edit layer 3 for the `fn + key` bindings. 
### VIA App
Use VIA Website: https://usevia.app
### Keychron Launcher 
 https://launcher.keychron.com/
### Troubleshooting
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

