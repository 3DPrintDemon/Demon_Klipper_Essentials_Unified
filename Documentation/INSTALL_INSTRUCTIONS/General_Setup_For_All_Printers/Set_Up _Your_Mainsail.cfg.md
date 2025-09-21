



# Mainsail.cfg Usage

**This is for parking the toolhead when you pause or cancel a print.** 

You should be sure to `[include mainsail.cfg]` as we will be using this! 
When inclding this file you pay very close attention to any sections defined within it! They must not be duplicated within your printer.cfg file, for instance the pause/resume section will casue problems if its defined twice in your system!!

Create a new editable file in your /config directory...

```
My_Macros.cfg
```

Then open the `Mainsail.cfg` file, select & copy the `[gcode_macro _CLIENT_VARIABLE]` at thr top & paste it all into `My_macros.cfg`.

Once pasted into the new file uncomment the `[gcode_macro _CLIENT_VARIABLE]` macro by selecting the whole macro & pressing `ctrl+/` on PC or `cmd+/` on MacOS.

Then use... 
```
[include My_Macros.cfg]
```
to include it in your `printer.cfg`. 

As `Mainsail.cfg` is read only & you can't make any changes to it.

Now set...
```
variable_use_custom_pos   : True
```

Then choose your desired XY parking position - make sure it's at least 5mm away from any axis max or min limits! You don't want the toolhead being bumped by an endstop!

```
< EAMPLE DO NOT COPY THIS BLOCK - PARKING BACK LEFT CORNER ON A 350 SIZE VORON >
< variable_custom_park_x    : 5.0 >
< variable_custom_park_y    : 345.0 >
```

Once you setup where you want/need the park position, the extruder retract/unretract movements & speeds etc. You can even define two locations if you wish, one for pause, & one for cancel.

You can define a specific cancel print location too if you wish! Set your X Y loaction with these:
```
variable_park_at_cancel   : True
variable_park_at_cancel_x : None
variable_park_at_cancel_y : None
```
You must set...

Idle_timeout. This is set in seconds so 600 is 10 minutes. This will be used for your mid print timeout after which Klipper can be set to kill your hotend heater & parts cooling fan while keeping the motors engaged & bed hot. 
```
variable_idle_timeout : 600
``` 

It will sit & wait for you. Or if you prefer you can set it to disable your motors & kill all heaters, cancel your print & even shut the printer down! 
It’s totally up to you!

###### NOTE: Don’t forget this is a different idle timeout than the one set in the idle timeout section in your printer.cfg, this is shown later in the install process!

<br>

Be sure to add the line below for the `variable_runout_sensor: ""` option between the quote marks ("") if you are using one!
```
filament_switch_sensor filament_sensor
```

Now were it says `variable_user_pause_macro : ""` you need to paste in...
```
_DEMON_PAUSE
```
Between the quote marks so it looks like this: `"_DEMON_PAUSE"`


Were it says `variable_user_resume_macro: ""` you need to paste in...
```
_DEMON_RESUME
```

Were it says `variable_user_cancel_macro: ""` you need to paste in...
```
_DEMON_CANCEL
```

Your new uncommented `_CLIENT_VARIABLE` macro should look like this when you're done. Image is for a Voron 2.4 350

BE SURE TO SAVE & RESTART!

![Mainsail_Client_Var](https://github.com/user-attachments/assets/bf10ec6c-7a72-4edb-b25d-7428429329bd)

### [Head back to where you were...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#set-up-your-mainsailcfg-file)
