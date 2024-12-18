# GENERAL SETUP FOR ALL PRINTERS

If you feel these macros are valuable enough to download & use please consider hitting that "sponsor this project" button or the Ko-Fi image below or at https://ko-fi.com/3dprintdemon & buying me a beer/coffee. Its always very much appreciated & anything you do send goes towards helping me continue putting my ideas out there for the whole 3D printing community. Sending even a little makes a difference! Thank you & happy printing!!

[<img width="171" alt="kofi_s_tag_dark" src="https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/08473899-563b-4b4d-9409-5e6602d6ec44">](https://ko-fi.com/3dprintdemon)

****************************************************************************************************************************

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
