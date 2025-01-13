
# Note's on Your Current Macro File Handling

Be sure to comment out your current START & END PRINT Macros &/or macro set & NOT delete them just yet! You dont want any Levelling (Z-Tilt or QGL) macros other calibration sets running.

The best way to do this is to comment out the old macro file include command in your `printer.cfg` by placing a hash in front of the command.
```
EXAMPLE
# [include ./Your_Old_Start_End_Macros_File.cfg]
```

If however you can't do this as the macros are in amongst other macros in the same file, or they're in your `printer.cfg` you can select every line of the macros you want to disable & press the following keyboard commands...
```
Crtl+/ on windows PC
```
OR....
```
Cmd+/ on MacOS
```
Now click `Save` & exit the file, no need to restart just yet, unless you want to.

### [Head Back To Where You Were...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#preparing-your-current-system)
