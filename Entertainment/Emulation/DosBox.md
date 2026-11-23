# DosBox

## Errors
### DosBox: libFLAC.so.8 Error 
dosbox_x86_64: error while loading shared libraries: libFLAC.so.8: cannot open shared object file: No such file or directory 
```
ln -s /lib/x86_64-linux-gnu/libFLAC.so.14 libFLAC.so.8 
```