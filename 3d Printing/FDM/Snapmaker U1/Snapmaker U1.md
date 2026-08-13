# Snapmaker U1

## To Do
https://github.com/Donkie/Spoolman/tree/master

## Firmware
The Snapmaker U1 uses Klipper as its core firmware for motion and device control, while utilizing Moonraker as the API and orchestration layer to manage communication with web clients like Fluidd or Mainsail. 

### Klipper
Handles the low-level hardware control and motion logic, with approximately 20% of the codebase modified by Snapmaker to support the U1’s parallel multi-toolhead system.  

### Moonraker
Acts as the web server that exposes APIs for client applications to interact with the printer, enabling remote monitoring and control.  


## Printing Times

### 0.4 nozzle
|Profile|Time|m|g|Cost|
|---|---|---|---|---|
|0.20 Standard @Snapmaker U1 (0.4 nozzle)|58m12s|8.22|26.11|0.66|
|0.16 Optimal @Snapmaker U1 (0.4 nozzle)|1h4m|8.33|26.45|0.67|
|0.16 High Quality @Snapmaker U1 (0.4 nozzle)|1h52m|8.33|26.35|0.67|
|0.12 High Quality @Snapmaker U1 (0.4 nozzle)|2h13m|8.05|25.57|0.65|
|0.12 Fine @Snapmaker U1 (0.4 nozzle)|1h17m|8.1|25.71|0.65|
|0.08 High Quality @Snapmaker U1 (0.4 nozzle)|3h29m|8.28|26.28|0.67|
|0.08 Extra Fine @Snapmaker U1 (0.4 nozzle)|1h53m|8.36|26.56|0.67|

### 0.2 nozzle

## Nozzles

### Swapping Nozzles

## Troubleshooting

### Unrecognised gcode type

"Unrecognized Gcode type" error on the Snapmaker U1 is typically caused by incorrect filament density values set to zero, a slicer profile defaulting to a non-U1 printer model (such as a Bambu Lab profile), or outdated firmware.

**Reference:** 
- https://youtu.be/SMvJs4irGbw?si=hCYh_5gYe_pRwZg-

