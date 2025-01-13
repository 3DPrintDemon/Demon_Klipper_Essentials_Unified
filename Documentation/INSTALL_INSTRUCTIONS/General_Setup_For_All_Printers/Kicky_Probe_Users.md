## Klicky Probe Users Specific File modifications!

For printers using `Klicky Probe` you need to open the `demon_homing_control_v1.4.cfg` file & comment out the `[homing_override]` section found there, lines 12-151. This is has to be done because Klicky Probe needs control of that section for their system. The printer won’t home if you forget to do this. Or maybe other bad things will happen, don’t say I didn’t warn ya! 

You will also need to go into the `Klicky-macros.cfg` file & add:

At the very top of the `[gcode_macro _Home_Z_]` add at line 837
```
{% set start_vars = printer["gcode_macro _START_VARIABLES"] %}
```

Then add this at the very end of the `[gcode_macro _Home_Z_]` macro, around line 865 directly under the line that reads `_exit_point function=Home_Z`

```
M400
_SAVE
{% if start_vars.z_tracker_reduced_monitoring == False %}
 UPDATE_DELAYED_GCODE ID=_ACTIVE_Z_MONITOR DURATION=1  
{% endif %}
```
Then add this as per the image below
```
_DRIVER_DEFINER
```
 at the top of their `[homing_override]` section. The best place is underneath the “collect user state variables” (the block of ‘set’ commands. Put it in with the “checks if the variable definitions are up to date” command, under `_CheckProbe action=query`
On line 577 in my file.


![Klicky_Driver_Definer](https://github.com/user-attachments/assets/aec9bd7f-a17a-44c6-929a-29a5acd91d1d)


This will call the macro that recognises your XY drivers & passes that info to the Demon Homing macro. For printers NOT using `Klicky Probe`, you don’t need to do this!

### [Head back to where you were...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#unless-youre-using-klicky-probe)

