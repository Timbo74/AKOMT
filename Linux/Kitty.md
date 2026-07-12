# Kitty

**Reference:**
- https://sw.kovidgoyal.net/kitty/

## Config

You can open the **config file** within kitty by pressing ```ctrl+shift+f2```, and reload it by pressing ```ctrl+shift+f5```.

### Fonts

Run the ```kitten choose-fonts``` command to use preview fonts and edit the ```kitten.cfg```.

### Titlebar in Gnome

If the Kitty window is not rendering the native title for the window manager then add the following line to the ```kitty.conf`` file to force X11 mode.

```
inux_display_server x11
```


## Kitten Commands
```
@                      clipboard              hints                  notify                 run-shell              transfer
ask                    desktop-ui             hyperlinked-grep       panel                  show-key               unicode-input
choose-files           diff                   icat                   query-terminal         ssh                    update-self
choose-fonts           edit-in-kitty          mouse-demo             quick-access-terminal  themes
```

## Layouts
| Command | Shortcut |
|--- | --- |
|Switch layouts |```control + shift + l```|

## Tabs

| Command | Shortcut |
|--- | --- |
|New tab                 |```control + shift + t```|
|Close tab               |```control + shift + q```|
|Move tab new window     |```control + alt + m```|
|Move to next tab        |```control + shift + arrow```|
|Move tab forward        |```control + shift + .```|
|Move tab backward        |```control + shift + ,```|
|Move to next tab        |```control + shift + arrow```|
|Set tab title| ```control + shift + alt + t```|

## Windows
| Command | Shortcut |
|--- | --- |
|New terminal window| ```control + shift + n```  |
|New window| ```control + shift + enter```  |
|Close window|```control + shift + w```|
|Resize window|```control + shift + r```|
|Next window|```control + shift + [```|
|Previous window|```control + shift + ]```|
|Move window back|```control + shift + b```|
|Move window forward|```control + shift + f```|
|Move window to top|```control + shift + ` ```|
|Focus specific window|```control + shift + 1/2/3 etc```|
