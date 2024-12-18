# GENERAL SETUP FOR ALL PRINTERS

If you feel these macros are valuable enough to download & use please consider hitting that "sponsor this project" button or the Ko-Fi image below or at https://ko-fi.com/3dprintdemon & buying me a beer/coffee. Its always very much appreciated & anything you do send goes towards helping me continue putting my ideas out there for the whole 3D printing community. Sending even a little makes a difference! Thank you & happy printing!!

[<img width="171" alt="kofi_s_tag_dark" src="https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/08473899-563b-4b4d-9409-5e6602d6ec44">](https://ko-fi.com/3dprintdemon)

****************************************************************************************************************************
### IF YOU RAN V1.0-V2.8 BE SURE TO UPDATE YOUR SLICER'S START GCODE OR NEW FEATURES WONT WORK!
**Instructions to do this are further down this page.**
**Also you must update ALL the macro files as this new version will NOT work correctly with old files!**
****************************************************************************************************************************

**If you own a Sovol SV06/Plus with a Sovol Klipper screen or a Sovol SV07/Plus & want to use the latest version of Klipper with Adaptive Meshing & more features you need to follow my How2 guide on how to update the Sovol Klipper screens on your printers.**

https://github.com/3DPrintDemon/How-to-Update-Sovol-Klipper-Screen-To-Latest-Klipper-SV06-and-SV07 
****************************************************************************************************************************

### Orca Slicer

Make sure you have the latest 2.2.0 (beta2 or later) version of Orca Slicer DO NOT USE ORCA SLICER DOT NET!!! BAD!!!

This link GOOD!

- https://github.com/SoftFever/OrcaSlicer/releases

******************************

# Whats New

- [Check Out the new macros & how to use them!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Update%20History/Update_History.md)


- ### [UPDATING FROM A PREVIOUS VERSION CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)


****************************************************************************************************************************

# Preparing Your Current System

- Make a Backup of your current system now! Be sure you at least download your current `/config` folder BEFORE YOU DO ANYTHING ELSE!! You want have a set of UNTOUCHED files to refer back to if needed!

- Disable your current macros for START_PRINT & END_PRINT, plus any others you dont need including any for calibration & levelling. [Tips on how to do this quickly here!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General%20_Setup_For_All_Printers/Your_Current_Macro_Files.md)



### Did you already do this???

- Don't miss this out, you need them! [INSTALL PREREQUISITES](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Prerequisites/Prerequisites.md)


### Not Sure How to SSH?

- If you're not too sure on how to "SSH" or would simply like to check you're doing things correctly [click here!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General%20_Setup_For_All_Printers/How_To_SSH.md)

****************************************************************************************************************************

# INSTALL THE MACROS VIA THE NEW SSH INSTALLER!

Enjoy the ease of installing the `Demon Klipper Essentials Unified` macro pack with a sinlge commamnd! - Additional installs & prerequisites still required!

This installer will look at your machine & see if you have a previous version of `Demon Klipper Essentials Unified` in your `/config` directory, if so it'll move it into a new directory called `Previous_Demon_Macros`. It will then clone the latest main branch files of `Demon Klipper Essentials Unified` to the original location on your system saving the old version for you. 

Not only that but the installer will also create numbered backups for any previous `Demon_Klipper_Essentials` directories, so you can use the installer over & over & keep all old versions in a local archive on your machine!

Lastly the installer will automatically install the latest `demon_vars.cfg` file in the correct place, overwriting any previous ones. So you don't have to worry about that!

Copy the code block below & paste it into your SSH terminal 

****************************************************************************************************************************
****************************************************************************************************************************

### SSH INSTALLER HERE:
```
wget -O - https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Install_Script/Demon_Klipper_Essentials_Installer.sh | bash
```
Your new files should now be avaiable to you on your printer! Please note you may need to reload your `Mainsail` browser page for new items to show correctly.

****************************************************************************************************************************
****************************************************************************************************************************

Then, paste the include command into your printer.cfg file
```
[include ./Demon_Klipper_Essentials_Unified/*.cfg]
```

This will bring these files into your system. Although it's best not to do this right away. It's better to do it after you have setup your printer.cfg a little more with the steps in the section below.

[Other ways to install are here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General%20_Setup_For_All_Printers/Other_Ways_To_Install.md)

****************************************************************************************************************************

# Define Save Variables Section

Add this to your `printer.cfg` preferably BEFORE you include the macros.

```
[save_variables]
filename: ~/demon_vars.cfg
```
If this file is not present on your first reboot but you have already added the `[save_variables]` section you'll see this error:

![EOF Error](https://github.com/user-attachments/assets/b67bb757-e83e-4d0c-9267-a80c3c3f5944)


Don't worry though this is just telling you the system created the file but it does not have the required saved variable within the file. Simply home the printer to create the variable within the file to clear the error. Unless you're running `Klicky Probe` then please [see here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General%20_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#unless-youre-using-klicky-probe) as simply homing the printer wont clear the error unless you have edited the Klicky macros first.

If you feel your demon_vars.cfg file is not working you can reinstall it directly from your current version of the `Demon Klipper Essentials Unified` macros.
```
cp -f ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Vars/demon_vars.cfg ~/
```

# Define Respond Section

These macros make use of the `respond` command so please make sure your printer.cfg has this defined for use in the system. This is command is already defined in the your `Mainsail.cfg` file, please make sure it is included. If you set these macros up correctly you wont need to add it to your printer.cfg, however if you choose not to use the `Mainsail.cfg` you will need to add the section manually.

```
[respond]
```
****************************************************************************************************************************

# Macro Layout Import/Restore

Lastly in Mainsail click the cogs top right of the screen & then click the `RESTORE` button in the `Interface Settings` window under the `General` tab. Now find the `backup-mainsail-DEMON-MACROS-v2.9.json` file, click open & then select the macros option, then click `Restore` to bring in the macro setup.

This will bring in the defualt macro layout.
- [CLICK HERE FOR MACRO LAYOUT FILE](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/tree/main/Other_Files/DEMON_Macro_layout_JSON)

It will not change your toolhead layout, you will need to do this yourself if you wish to. This is done by changing the `Style` option in the `Control` tab of the `Interface Settings` window to `Circle`.

![Macro_Layout](https://github.com/user-attachments/assets/d062ceed-75b6-498c-9bc3-27778f27c6dc)


****************************************************************************************************************************

# Define Force Move Section

be sure to define the force move section in your printer.cfg file or your printer wont be able to make use of the new homing routine. 
```
[force_move]
enable_force_move: true
```

# Idle Timeout printer.cfg 

To use the new timeout settings correctly you should set your `printer.cfg` `[idle_timeout]` section like this:
```
[idle_timeout]
gcode:
    _DEMON_IDLE_TIMEOUT
timeout: 3600
```

This will call the new Demon timeout macro after 1 hour & execute the functions of your choice in the demon_user_settings file

****************************************************************************************************************************

# Load & Unload Macros


###### NOTE: Klipperscreen Macros copy/paste into file is no longer required. Any previous copies of these LOAD/UNLOAD macros must be removed from any additional macro.cfg files in favour of the new included LOAD/UNLOAD macros. If you do not do this then there will be issues with the loading & unloading of filament.

All load & unload macros now check the printer's `max_extrude_only_velocity` setting, a value of 20 or below will pass the check. 

Be sure your `printer.cfg` file `[extruder]` section contains...

```
max_extrude_only_velocity: 15
```

****************************************************************************************************************************

# Mainsail.cfg Usage

**This is for parking the toolhead when you pause or cancel a print.** 

You should be sure to `[include mainsail.cfg]` as we will be using this! 

You need to open the `Mainsail.cfg` file, select & copy the `[gcode_macro _CLIENT_VARIABLE]` & paste it all into a new editable `my_macros.cfg` file for example, as that `Mainsail.cfg` is read only & you can't make any changes to it.

Once pasted into the new file uncomment the `[gcode_macro _CLIENT_VARIABLE]` macro by selecting the whole macro & pressing `ctrl+/` on PC or `cmd+/` on MacOS.

Then setup where you want/need the park position, the extruder retract/unretract movements & speeds etc. You can even define two locations if you wish, one for pause, & one for cancel.

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


Were it says `variable_user_cancel_macro: ""` you need to paste in...
```
_DEMON_CANCEL
```

Were it says `variable_user_resume_macro: ""` you need to paste in...
```
_DEMON_RESUME
```


Also be sure to add the line below for the `variable_runout_sensor: ""` option between the quote marks ("").
```
filament_switch_sensor filament_sensor
```
Your new uncommented `_CLIENT_VARIABLE` macro should look like this when you're done. Image is for a Voron 2.4 350

BE SURE TO SAVE & RESTART!

![Mainsail_Client_Var](https://github.com/user-attachments/assets/03d025db-8a73-4b9a-909c-236b64362663)

****************************************************************************************************************************


# Printer Lights (White LEDs)
Be sure to name any White LEDs that are on an output_pin in the `printer.cfg` file you wish the macros to control to:

```
[output_pin Printer_Lights]
```
****************************************************************************************************************************


# Neopixel Toolhead LEDs 

....if using a Voron or another machine with neopixel LEDs in the toolhead. Be sure to name any neopixel toolhead LEDs:

```
[neopixel sb_leds]   
```
Or you will get an invalid for LED error.

....If you're using an SV08 leave the neopixel LEDs their defualt name:
```
[neopixel Screen_Colour]
```
If you have more than 3 neopixel LEDs in your chain be sure to correctly edit the file you're using to include all LEDs in the chain. By default it is set for 3 Stealthburner style toolhead LEDs.
You will need to change this if you have a long chain or use neopixels elsewhere on your printer.


![LED Chain Settings](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/d452e81e-5847-4b16-a752-760f587ffc4d)


****************************************************************************************************************************

# Setting up KLIPPER's Adaptive Mesh option. 

There is no longer any need for a separate KAMP install for meshing. The adaptive purge line & smart park are still needed.

For Klipper's Adaptive Mesh feature to work you must have:
- You must have a version of Klipper later than 1st Feb 2024
- Enabled your Slicer for `Label Objects`
- It's good to have `Exclude Objects` too...
- Added the `file_manager` section to your `moonraker.conf` file for `object processing`  
- Added the `Exclude Object` section to your `printer.cfg` file

###### Find options under Orca main window Process/Global/Others

![ORCA Label](https://github.com/user-attachments/assets/1a1cd72e-11d9-4023-bc6e-ef0e0b9e0a9a)

Add this to your `moonraker.conf` file:
```
[file_manager]
enable_object_processing: true
```

Add this to your `printer.cfg` file:
```
[exclude_object]
```

Save & restart!

****************************************************************************************************************************

# Setting up KAMP_LiTE Adaptive Purge & Smart Park

KAMP_LiTE is simply KAMP but without the adpative meshing macro, as it is not required now klipper has Adaptive Meshing included by default. However the Adpative Purge & Smart Park features are still very useful! Changes listed in the link.

You must have a version of Klipper later than 1st Feb 2024. You must have completed the steps described in the above section.

Also the fork KAMP_LiTE must be installed & included, how to do this is in the below link:

https://github.com/3DPrintDemon/KAMP_LiTE/releases/tag/v1.0


You must set your desired values in the KAMP_Settings.cfg

![KAMP_LiTE Settings](https://github.com/user-attachments/assets/3ecfcd1c-b117-43b8-b8cb-9121be6c7b95)

Then you must activate the KAMP settings in the `demon_user_settings_v2.8.cfg` file.

![KAMP_LiTE Vars](https://github.com/user-attachments/assets/58ebc555-2bad-465c-b052-04c9f189171d)


To use correctly ensure your `extruder` section in your `printer.cfg` has the line below defined & that its set to 5 or higher, if not the KAMP purge will be skipped & it wont work!
```
max_extrude_cross_section: 5
```


###### NOTE: If `variable_adaptive_meshing` is set to `True` then the system will override the values for `variable_use_kamp_adaptive_purge` & `variable_use_kamp_smart_park`. It will always use the adaptive purge & smart park features no matter what the settings are. Even if they're set to false. User control is handed back once `variable_adaptive_meshing` is set to `False`


****************************************************************************************************************************

**To use adaptive meshing all files MUST have been sliced with `Label Objects` active.** 
IF NOT YOU WILL RECEIVE THE FOLLOWING ERRORS!!

If you use ORCA SLICER:

`Error evaluating 'gcode_macro PRINT_START:gcode': gcode.CommandError: This error is caused by the sliced file not having "Label Objects" enabled! Please disable Adaptive_Meshing in the demon_user_settings.cfg or re-slice the file with it enabled and restart the print!`

If you use another slicer:

`Internal error on command:"PRINT_START"`

`Internal error on command:"BED_MESH_CALIBRATE"`




****************************************************************************************************************************
# BE SURE TO SET YOUR MACRO VARIABLES & WATCH THIS VIDEO - bit outdated - todo: make new one!

- Configure the macros in one place! Set the variables for all the Demon Klipper Essentials macros in the `demon_user_settings_v2.9.cfg` file
- There is no need to edit any macro code with this macro pack!
- NOTE: If you don't set `_CLEAN_VARIABLES` the printer will give you an error if you haven’t done this & try to use the nozzle clean macros.


![Set_Your_Vars](https://github.com/user-attachments/assets/bc0c6705-557b-4b27-a5b4-877830e4d4f7)




**BE SURE TO WATCH THIS WHILE YOU SET UP YOUR MACROS...**

<a href="http://www.youtube.com/watch?feature=player_embedded&v=s4poVSt5a2g
" target="_blank"><img src="http://img.youtube.com/vi/s4poVSt5a2g/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="480" height="360" border="10" /></a>

Long video on settings walkthrough: https://youtu.be/s4poVSt5a2g

****************************************************************************************************************************


# NEW DEMON MACROS FEATURE!! DEMON HOMING CONTROL!

This sort of thing has been available for some time elsewhere but this is the first time we have a version integrated here in the 3DPrintDemon macros. This feature will lower the motor current on the X & Y axis motors when homing the printer & then increase it again to normal levels afterwards! This means your printer will be a little more gentle when homing. 

This system will also not let you home the printer with the toolhead under 5mm high & it’ll always raise the Z axis by an amount of your choosing if the motors are disarmed BEFORE actually homing the printer in the Z & Y axes. Plus when the motors are armed & the printer is in a homed state after that initial raise it won’t raise the axis again when homing until they’re disarmed or homing is commanded at <5mm! 
So there’s no more risk of homing at Z0.2mm after a stoppage or a Z offset calibration test or risk hitting any clips or nozzle cleaners etc!
Not only that the homing macros know automatically if you’re using a BTT Eddy Probe or not and will adapt themselves to it!

****************************************************************************************************************************

## DEMON Homing Control - IMPORTANT!
To use the `demon_homing_control_v1.2.cfg` file
be sure to comment out or un-include & disable any old homing or sensorless homing macros you might have, you will also need to comment out any old `[safe_homing]` & `[homing_override]` sections in your `printer,cfg` or macro files.

****************************************************************************************************************************

## UNLESS you’re using `Klicky Probe`!!! 

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

![Klicky_Driver_Definer](https://github.com/user-attachments/assets/90200ca7-d21d-436d-92ad-aebebc3305f7)


This will call the macro that recognises your XY drivers & passes that info to the Demon Homing macro. For printers NOT using `Klicky Probe`, you don’t need to do this!

****************************************************************************************************************************

## Z Endstop Switch

If you’re using your printer with a separate endstop switch & you are NOT using the `Klicky` macros you need to set the location of your Z endstop switch in the Demon macros `demon_user_settings_v2.9.cfg file`. There’s two variables for you to define the location of your separate endstop switch.

Open the `demon_user_settings_v2.9.cfg` file & search 

```
z_endstop_location_x
``` 
&...
```
z_endstop_location_y
```
then enter your switch axis locations.

There are also other definable homing options to set there too! So be sure to setup ALL your homing variables & tune your sensorless homing values in your `printer.cfg` at the desired homing power levels, & to check that your chosen endstop will trigger when needed! 

When testing homing for the first time be EXTREMELY CAREFUL & be ready to hit EMERGENCY STOP!! You may need to abort the homing process.

If for any reason you wish to revert back to your normal homing system, simply comment all back in from your old system & disable the `demon_homing_control_v1.2.cfg` file by commenting out its full content apart from the file version number at the bottom. Make your selection & then by then `ctrl+/` on wondows or `cmd+/` on MacOS.

****************************************************************************************************************************


# DEMON HOMING CONTROL SETTINGS 
Found in the demon_user_settings_v2.9.cfg

`home_y_first` = set True to home the Y axis first or False to home X first. 

`override_home_power_safety` = leave this set False unless you need a high homing current. Damage may result if used improperly!

`home_power` = This is the power level to reduce the X Y axis down to while homing. Normally 0.6-0.7 is good

`pre_home_lift` = Set height to lift the toolhead prior to homing if axes are not enabled & homed. Range of 0-20mm

`z_lift_speed` = Set the speed to lift the Z axis. Range of 1-25mm/s - limited by your max_z_velocity

`axis_backoff_speed` = Set speed for the toolhead to back away from the axis endstop mm/s

`axis_backoff_distance` = Set distance in mm to back the toolhead away from the axis endstop

`axis_register_clear_wait` = Set axis register clear time. If using sensorless homing this value should be 2 seconds or slightly over

`homing_movement_travel_speed` = Set speed for the toolhead to move to the Z axis endstop or probing location in mm/s 

`set_probe_point_default` = Set False if you want a custom probing point for your bltouch/eddy probe

`set_probe_custom_x` = Set custom X probe position for your bltouch/eddy probe

`set_probe_custom_y` = Set custom Y probe position for your bltouch/eddy probe

`post_z_switch_backoff` = Set True to raise Z axis & back the gantry away from the rear of the printer after Z endstop switch press

`z_switch_backoff_y_dist` = Set how far to back the gantry away from the rear of the printer - not used if homing with probe

`post_z_switch_backoff_height` = Set safe Z height to park the toolhead after endstop switch press - not used if homing with probe

`z_endstop_location_x` = If you're using a separate non-Klicky Probe Z endstop switch of any sort set X axis location

`z_endstop_location_y` = If you're using a separate non-Klicky Probe Z endstop switch of any sort set Y axis location


****************************************************************************************************************************

# BTT EDDY PROBE

To setup your `BTT Eddy probe` you’ll need to download their .cfg file. They have 3 available, what the differences are is well explained on their Github so I won’t rehash it here. 

For use here with the Demon macros we need to be using the regular version (non-homing & non-offset)
https://github.com/bigtreetech/Eddy/blob/master/sample-bigtreetech-eddy.cfg

For a Printer with `Eddy Probe` being used as your Z endstop probe, basically homing the printer with the probe (No separate Z endstop Switch) you need to modify their file. 
Don’t worry it’s super simple! Open the file linked above & “comment in” lines 101-105.

 IMPORTANT>>>>>>> LEAVE  LINE 106 COMMENTED OUT!! 

I REPEAT LEAVE LINE 106 COMMENTED OUT!!! Comment in lines 101-05 ONLY!

![BTT_Eddy_setup](https://github.com/user-attachments/assets/6340a21d-1ac6-4be4-b16e-c0f0b2254c31)



##### NOTE: If you're using Eddy as a bed scanner only & have a separate endstop switch DO NOT do the above. Leave the file as it is.

Actual Probe setup & calibration. You will need to setup your Eddy Probe still, steps how to do this are here:
https://github.com/bigtreetech/Eddy/blob/master/README.md

Once Your probe is setup correctly & tested working as per the above BTT github guide all Demon Z_Probe calibration, machine meshing & machine levelling macros all now automatically detect & support BTT Eddy Probe! Just hit go & it’ll do its thing!

## Eddy Coil Setup
if you're using the Coil version of the Eddy Probe & are struggling to set it up here is what you need! edited cfg file with correct settings for use with a EBB36 & set up to deal with high temperature printing. 

NOT FOR EDDY USB!

https://github.com/3DPrintDemon/Eddy/releases/tag/Eddy_Coil_with_EBB36_Edited_cfg_v1.0


****************************************************************************************************************************
# SLICER SETUP

You have to modify your slicer's `Machine Gcode` that is sent to the printer.
The basic commands to do this are in the macro files, the expanded setup for use with Orca slicer is shown below, please take special care to copy them in correctly, as even a single error can stop the whole system from working.
Below shows a fully setup slicer as per recommended Mainsail settings combined with the macro settings for Orca Slicer using relative extrusion.

Cut/paste your current gcode out of the gcode window & into Notepad/Notes to save if you ever revert back & need it again. Replace your old Start gcode with the correct one for your slicer.
the example below is for Orca slicer. 
It's very important the last line of the `Machine Start Gcode` is a single long line as shown below, with no returns in it. 
If this is not the case the system will fail as soon as you start a print.

###### NOTE: If your screen can't hold the text in a single line the computer will place it on mulitple lines itself, however there will not be actual "returns" placed into it, as far as the printer will see it will still be one long line.

Here is how they should look in Ocra Slicer. 

![Orca_Slicer_Printer_G-code](https://github.com/user-attachments/assets/6b87af09-35f0-4491-a54e-55385a85f80b)

These are fully setup codes as per recommended Mainsail settings combined with the macro settings for Orca Slicer using relative extrusion, as per the image....

Machine Start G-code:

```
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]
M104 S0
M140 S0
PRINT_START EXTRUDER=[nozzle_temperature_initial_layer] BED=[hot_plate_temp_initial_layer] LAYER=[layer_height] FILAMENT=[filament_type] EXCLUDE=[exclude_object] SURFACE="[curr_bed_type]" OAPA=[adaptive_pressure_advance]
```
Machine end G-code:
```
; printing object ENDGCODE
PRINT_END
```

Before layer change G-code:
```
;BEFORE_LAYER_CHANGE
;[layer_z]
G92 E0
```

After layer change G-code:
```
;AFTER_LAYER_CHANGE
;[layer_z]
SET_PRINT_STATS_INFO CURRENT_LAYER={layer_num + 1}
M117 Layer {layer_num+1}/[total_layer_count] : {filament_settings_id[0]}
```

Change filament G-code:
```
_FIL_CHANGE_PARK
```

Change extrusion role G-code:
```
_DEMON_ADAPTIVE_PA TYPE=[extrusion_role]
```

Pause G-code:
```
PAUSE
```

### Other Slicers
- [HERES THE FILE FOR OTHER SLICER'S G-CODE START](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Other_Slicers_Start_G-code/Other_Slicers.md)


### Orca Slicer Additional
If you get the error in the photo below it means your version is not v2.2.0 (beta or beta2 or later)
PLEASE UPDATE YOUR SLICER! 

DO NOT USE ORCA SLICER DOT NET!!! ....BAD!!!

This link GOOD!

- https://github.com/SoftFever/OrcaSlicer/releases


![Orca Fail](https://github.com/user-attachments/assets/2fd3bbf6-2c4b-4e89-ba27-5bf112cbd179)

**Fin...**

****************************************************************************************************************************
# If You're Using A Sovol SV08 Printer

- [Further configuration steps are here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Sovol_SV08_Setup/SV08_EXTRA_INSTRUCTIONS.md)

****************************************************************************************************************************

# Additional Configuration - EXTRA STEPS



## Chamber Monitoring & Fan Control

To get the most from these macros you’ll need to add a Chamber thermistor to your machine if you haven’t already & a Chamber exhaust fan. 
- If you have a Chamber exhaust fan call it `[temperature_fan chamber]`
- If you instead have a Chamber Thermistor only & no Exhaust fan call it `[temperature_sensor Chamber_Temp]`

****************************************************************************************************************************

## Printer LED lights
- If you have printer LED lights (NOT neopixel) call them `[output_pin Printer_Lights]`
- NeoPixel LEDs are dealt with in the additionally installed files.

****************************************************************************************************************************

## Filament Sensor
If you have or are going to install a filament sensor this must be added to your `printer.cfg` file to run the filament sensor. The filament runout check in the `PRINT_START` macro can then be enabled & disabled in the `_START_VARIABLES` macro if you dont have one or dont want to perform the check at the start of the print.
```
[filament_switch_sensor filament_sensor]
switch_pin: ^### <<<<<< Insert board pin for sensor
pause_on_runout: False
insert_gcode:
    { action_respond_info("Insert Detected") }  
runout_gcode:
    { action_respond_info("Runout Detected") }
    {% if printer.print_stats.state == "printing" %}
      _FIL_CHANGE_PARK
    {% endif %}
```

If you have an encoder based sensor like the BTT Smart Sensor add this:
```
[filament_motion_sensor encoder_sensor]
switch_pin: ^### <<<<<< insert board pin
detection_length: 9
extruder: extruder
pause_on_runout: False
insert_gcode:
    { action_respond_info("Filament Encoder is Running") }
runout_gcode:
    { action_respond_info("Filament Encoder Stall Detected") }
    {% if printer.print_stats.state == "printing" %}
      PAUSE
    {% endif %}

[delayed_gcode encoder_sensor]
initial_duration: 1
gcode:
    SET_FILAMENT_SENSOR SENSOR=encoder_sensor ENABLE=0
```

****************************************************************************************************************************

## Modifying KlipperScreen Menus For New Features

Setup Klipperscreen PREPARE Menu

Open your `KlipperScreen.conf` file in your printer’s /config folder. If you don’t have one create one.
Paste the lines below in to create the new KS menu!
```
[menu __main custom]
name: Prepare
icon: klipper

[menu __main custom present]
name: Present Toolhead
icon: bed-level-t-r
method: printer.gcode.script
params: {"script":"present_toolhead"}

[menu __main custom load]
name: Load Clean
icon: arrow-down
method: printer.gcode.script
params: {"script":"load_clean"}

[menu __main custom unload]
name: Unload Clean
icon: arrow-up
method: printer.gcode.script
params: {"script":"unload_clean"}

[menu __main custom stow]
name: Stow Toolhead
icon: bed-level-b-l
method: printer.gcode.script
params: {"script":"stow_toolhead"}

[menu __main custom ready_up_pla]
name: Ready Up PLA
icon: filament
method: printer.gcode.script
params: {"script":"ready_up_pla"}

[menu __main custom ready_up_asa]
name: Ready Up ASA
icon: filament
method: printer.gcode.script
params: {"script":"ready_up_asa"}

[menu __main custom ready_up_petg]
name: Ready Up PETG
icon: filament
method: printer.gcode.script
params: {"script":"ready_up_petg"}

[menu __main custom ready_up_tpu]
name: Ready Up TPU
icon: filament
method: printer.gcode.script
params: {"script":"ready_up_tpu"}

[menu __main custom clean]
name: Nozzle Clean
icon: shuffle
method: printer.gcode.script
params: {"script":"clean_nozzle"}

[menu __main custom machine_level]
name: Machine Level
icon: z-tilt
method: printer.gcode.script
params: {"script":"machine_level_cold"}

[menu __main custom z_ascender]
name: Z Ascender
icon: warning
method: printer.gcode.script
params: {"script":"z_ascender"}

[menu __main custom heatsoak_toggle]
name: Heatsoak Toggle
icon: heat-up
method: printer.gcode.script
params: {"script":"HEATSOAK_TOGGLE"}

[menu __main custom reset_file]
name: Reset Print State
icon: sd
method: printer.gcode.script
params: {"script":"_RESET_FILE_STATE"}

```

The icons are appropriate if you use with the material-darker theme. Other theme’s icons may differ.

You can also add your chamber temp to the menubar in KlipperScreen, this to your `KlipperScreen.conf` file:
```
titlebar_items: chamber
```

****************************************************************************************************************************

# Auto Shutdown Moonraker Power Device

To make use of the `_GOODNIGHT` post print auto shutdown macro you must enable your RPI as a secondary MCU so it can control your shutdown relay hardware. Use this link to do that.

- https://github.com/Klipper3d/klipper/blob/master/docs/RPi_microcontroller.md

After you've followed the process in that link be sure that this is added to your `printer.cfg` file.
```
[mcu host]
serial: /tmp/klipper_host_mcu
```

## Word of warning! Adding a power control device like a power shutdown relay can sometimes involve working with & modifying your printer’s wiring that runs on mains level voltage!  This can be extremely dangerous with a definite risk of serious injury, fire, loss of property & even death! You have been warned. I accept no liability or responsibility for any loss, death or injury caused directly or indirectly by you or anyone else attempting this! This is all on you, attempt implementation ENTIRELY AT YOUR OWN RISK!

## Connections

Example below for using the BTT Power Relay v1.2

See the install instructions for this product on the BTT Github! 

- https://github.com/bigtreetech/BIGTREETECH-Relay-V1.2

However….

This link is far more helpful! 

- https://www.youtube.com/watch?v=5wJff-hY90s

You will need ensure that you have set your instance to be able to control your Pi’s GPIO pins as mentioned previously in this document. Then you need to choose which 2 GPIO pins on your Rpi to use to control the relay, connect the `Printer Power` GPIO pin along with a single ground pin to the PSon plug on the relay board. You have to then connect the Pi's `Reset Power` GPIO pin to the `reset` pin on the relay board, leave the 5v pin next to it empty.

Then if you wish you can add a physical momentary switch to a 3rd GPIO pin & another ground pin. Then mount it somewhere of your choice on your printer. This button will act as an instant on button & re-power the printer with a single push, normally you have to manually switch both pins on yourself but now Moonraker will now activate both pins at the same time for you! Magic!

## Setup

Then you need to SSH into your pi & run:

###### NOTE: these commands are for a real Rpi, cloned system or systems built on different images will probably vary.
```
sudo nano /boot/config.txt
```
Then near the bottom of the file at the end of the first section & in the space BEFORE the start of the `[CM4]` section paste in:
```
gpio=16=op,dh # Example GPIO pin, choose a GPIO pin to control power device’s PSon pin
```
Then use the commands at the bottom of the screen to exit & save the file.

This will make sure that the GPIO pin you will use for the relay’s `PSon` pin is automatically pulled “high” when the Pi is first turned on at the beginning of the host boot sequence. This in turn should keep your relay from automatically opening & shutting the printer down while the Pi is booting. It does this at boot because the power relay is not seeing the ‘keep switched on’ signal from the Pi, & it needs that signal. 
Trust me it is very annoying if you don’t do this!

You will then need to modify your `Moonraker.conf` file by adding these…
```
[button PowerUp]
type: gpio
pin: ^gpio21 # Example GPIO pin, you can choose your own here
minimum_event_time: .05
on_press:
  {% do call_method("machine.device_power.post_device", device="Reset Power", action="on") %}
  {% do call_method("machine.device_power.post_device", device="Printer Power", action="on") %}

[power Printer Power]
type:gpio
pin:gpio16 # Example GPIO pin, you can choose your own here
on_when_job_queued: True
initial_state:on
off_when_shutdown: True
locked_while_printing: False
restart_klipper_when_powered: False
# restart_delay: 2
bound_services:

[power Reset Power]
type:gpio
pin:gpio12 # Example GPIO pin, you can choose your own here
on_when_job_queued: True
locked_while_printing: True
initial_state:off
restart_klipper_when_powered: True
restart_delay: 2
Timer:2
```
You need these two pins as the BTT relay firmware requires a reset command while the `PSon` pin is high. If this is not the case & the `PSon` pin is low (off) & you hit reset the relay power up but trip out again after 8 seconds. This is normal. The `PSon` pin must be high (on) when the reset is pressed. The PowerUp physical button will activate both GPIO pins together when pushed meaning you only need a single push of the physical button to control both pins & re-power the printer instantly.

After that add this macro to your `macros.cfg`
```
[gcode_macro M81]
gcode:
 {action_call_remote_method("set_device_power",device="Printer Power",state="off")}
```

Lastly this is used by the `PRINT_END` macro to select the Auto Shutdown feature & should be pasted into your `printer.cfg` file.
```
[output_pin PRINTER_AUTO_OFF]
pin: ### <<<<<< Insert unused board pin for state change only, monitored by system
```
This will give you full control of your power relay unit via the GUI Switch & the `PRINT_END` & `_GOODNIGHT` macros.

****************************************************************************************************************************

## Extra Bonus...
As an added bonus you can add a second physical button to a 4th GPIO pin to use as a physical Emergency Stop button!

```
[button estop]
type: gpio
pin: gpio26 # Example GPIO pin, you can choose your own here
on_press:
  {% do call_method("printer.emergency_stop") %}
```


If you made it to the end here congrats! 

I hope this macro pack makes a nice difference to your printing life, don't forget, if you feel its valuable enough to use please consider hitting that "sponsor this project" button & buying me a beer/coffee. Its always very much appreciated. Thank you & happy printing!!

[<img width="171" alt="kofi_s_tag_dark" src="https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/08473899-563b-4b4d-9409-5e6602d6ec44">](https://ko-fi.com/3dprintdemon)
