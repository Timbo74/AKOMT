# Espanso
https://github.com/espanso/espanso  

## Installation
**Reference**: https://espanso.org/install/  
Windows
```powershell
winget install Espanso.Espanso
```

Linux (Ubuntu/Debian)
```bash
wget https://github.com/espanso/espanso/releases/latest/download/espanso-debian-wayland-amd64.deb
sudo apt install ./espanso-debian-wayland-amd64.deb
sudo setcap "cap_dac_override+p" $(which espanso)
```

## Config

### Match.yml 
Windows
```
APPDATA/roaming/espanso/base/match.yml
```

Linux
```
~/.config/espanso/base/match.yml
```
#### Matches: Date & Time 
```yml
matches:
  # Print the current date
  - trigger: ":date"
    replace: "{{mydate}}"
    vars:
      - name: mydate
        type: date
        params:
          format: "%d/%m/%Y"

  # Print the current time in 24H format
  - trigger: ":time"
    replace: "{{mytime}}"
    vars:
      - name: mytime
        type: date
        params:
          format: "%H:%M"

  # Print the current time and date
  - trigger: ":now"
    replace: "{{mydatetime}}"
    vars:
      - name: mydatetime
        type: date
        params:
          format: "%H:%M - %d/%m/%Y"
```
