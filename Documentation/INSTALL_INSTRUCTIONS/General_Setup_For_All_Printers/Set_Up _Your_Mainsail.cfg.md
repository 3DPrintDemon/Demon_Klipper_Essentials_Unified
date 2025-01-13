



# Mainsail.cfg Usage

**This is for parking the toolhead when you pause or cancel a print.** 

You should be sure to `[include mainsail.cfg]` as we will be using this! 
When inclding this file you pay very close attention to any sections defined within it! They must not be duplicated within your printer.cfg file, for instance the pause/resume section will casue problems if its defined twice in your system!!

You need to open the `Mainsail.cfg` file, select & copy the `[gcode_macro _CLIENT_VARIABLE]` & paste it all into a new editable file for example...

```
My_Macros.cfg
```
Once pasted into the new file uncomment the `[gcode_macro _CLIENT_VARIABLE]` macro by selecting the whole macro & pressing `ctrl+/` on PC or `cmd+/` on MacOS.

Then use... 
```
[include My_Macros.cfg]
```
to include it in your `printer.cfg`. 

As `Mainsail.cfg` is read only & you can't make any changes to it.


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

###### NOTE: Don’t forget you should set the idle timeout section in your printer.cfg as per the next section below!

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

Also be sure to add the line below for the `variable_runout_sensor: ""` option between the quote marks ("").
```
filament_switch_sensor filament_sensor
```
Your new uncommented `_CLIENT_VARIABLE` macro should look like this when you're done. Image is for a Voron 2.4 350

BE SURE TO SAVE & RESTART!

![Mainsail_Client_Var](https://github.com/user-attachments/assets/bf10ec6c-7a72-4edb-b25d-7428429329bd)

### [Head back to where you were...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#set-up-your-mainsailcfg-file)
