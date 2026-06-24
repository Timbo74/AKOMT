# Terminal

## Settings

### Open the default settings file (defaults.json)

Open a Terminal and press ```Control + Alt + Comma (,)```, the default settings file will be opened in your text editor.

### Open user settings file (settings.json)

Open a Terminal and press ```Control + Shift + Comma (,)```, your settings.json file will be opened in your text editor.

## Useful Tips

### Move a tab into it's own window

**Manually** 

Press ```Ctrl + Shift + P``` to open the Command Palette.  Type ```Move tab to a new window``` and press ```Enter```.

**Keyboard Shortcut** 

 - ```Ctrl + ,``` to open Terminal settings.
 - Select ```Actions```
 - Click ```Add new```.
 - Select ```Move tab to a new window``` for the action.
 - Specify the keyboard shortcut, eg ```Ctrl + Alt + m```.
 - Click ```Save```.

### Run an application in a new tab

```
wt -w 0 nt "<command-goes-here>"
```
For example
```
wt -w 0 nt nvim c:\autoexec.bat
```

