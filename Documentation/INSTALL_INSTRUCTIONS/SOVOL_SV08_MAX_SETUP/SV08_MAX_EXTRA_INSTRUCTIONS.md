# :gift: SUPPORT YOUR FRIENDLY 3DPrintDemon! :gift:

>[!TIP]
>Please consider supporting this project…. Even if it’s for a single donation!
>
>It really does make a difference & any amount you send is greatly appreciated!

This macro pack is the cumulation of 3 years of work by one person alone, there have been countless late nights, missed family time, bottomless cups of coffee, as well as a boat load of effort & dedication. There’s been endless weeks of writing code & then probably that amount of time again at least thoroughly testing the files so that you can rest assured that they work & these macros will NOT damage or harm your printer in any way! Not counting any improper setup of course…

Plus I provide the DEMON DISCORD to help anyone with getting DKEU working on their system!

All of this is given away to the community for FREE.

However I would like to kindly ask that if you gain any sort of benefit, joy, improved quality of life using your printer, or maybe if you use these macros as part of your side or regular business, for example in your print farm or to help make your craft fair items please consider making a pledge on the 3DPrintDemon Patreon page for however much you feel these macros are worth to your printing life & your business income! You can choose the amount of your donation & how long you are an active donating supporter!

You can stay a supporter on the 3DPrintDemon Patreon sending donations of your choosing for as long as you like. Maybe it’s for just a month or two for single private users that would like to show your gratitude, or maybe you could consider ongoing support if you’re a business owner & make regular use of my work to aid your business.

Active supporters have a special channel on the Demon Discord server & are provided with a higher level of support over non supporting members. Just make your discord user name known & you’ll be granted “supporter” privileges.

:red_circle: [JOIN THE 3DPRINTDEMON PATREON](https://patreon.com/3dprintdemon) as an active donating member & show your support for my work!

Your donations are used to feed my printers & give them the latest fancy pants new parts so I can continue adding new features, fixing bugs & providing time for helping you all to get the macros running & fixing issues you might experience!

Be sure to use the website not the IOS app, it's cheaper!


<br>
<br>
<br>

# IF YOU'RE USING A SOVOL SV08 MAX PRINTER!

<br>

****************************************************************************************************************************
### :red_circle: You need to complete everything in the [General Setup For All Printers](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#the-file-structure-has-changed-for-v294-onwards) first!

****************************************************************************************************************************

<br>

# DEMON DISCORD!

Come & join the community! We've just launched Demon Discord, help us start building a fantastic user focused resource for help & support from other users, share custom expansion gcode, or simply chat & show off your machine & your latest prints!

<p align="left">
    <img width="500" alt="Demon_Discord" src="https://github.com/user-attachments/assets/980b8b69-f78b-43b1-be27-cc1236fcf794" />
    <https://discord.gg/KEbxw22AD4>
</p>

[https://discord.gg/KEbxw22AD4](https://discord.gg/KEbxw22AD4)

<br>

****************************************************************************************************************************

<br>

# HOW TO FIX & UPDATE YOUR SOVOL EMMC IMAGE! - OPTIONAL

To update system packages & to update latest software versions, plus how to get rid of those annoying Moonraker Warnings for good!

:red_circle: [CLICK HERE!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Fix_Sovol_EMMC_Images/FIX_SOVOL_EMMC_IMAGES.md)

<br>

****************************************************************************************************************************

<br>

# HOW TO MODIFY THE SOVOL CHAMBER HEATER - OPTIONAL

This allows Klipper & DKEU to monitor the heater's actual temperature & to control it's output power, including adding additional safety features that'll protect you, your printer, & not to mention your home/business property!

:red_circle: [CLICK HERE!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/Sovol_Chamber_Heater.md)

<br>

****************************************************************************************************************************

# Use Your SV08 Max WITHOUT The Sovol Filament Buffer/Feeder

To use your SV08 Max without the buffer follow this section & miss out the `Add Clog Detection Override Pin!` & `Add Jam Detection Override Pin!` sections below. 

Or if you want to use the buffer, miss this section out & follow the two sections below for adding pins.

Comment out your buffer_stepper.cfg file include command in your printer.cfg

```
# [include buffer_stepper.cfg]
```

Now ssh into your printer & send this command…..

```
cd ~/klipper/klippy/extras

wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/NO_BUFFER/filament_switch_sensor.py --backups=1
```

```
sudo reboot now
```
 
You have just installed the file that removes hardcoded commands for the buffer.

<br>

****************************************************************************************************************************

# Use Your SV08 Max WITH The Sovol Filament Buffer/Feeder

<br>

>[!IMPORTANT]
>In the `buffer_stepper.cfg` file you have just installed by clicking the `GET` buffer file button you will get a big red error, you'll need to add the pins shown a few lines down to use as a manual override for the clog & Jam detection.
This will allow you to disable the automated clog & Jam detection system during a print if you keep getting false triggers!

<br>

# Add Clog Detection Override Pin!

See line 45 of the `buffer_stepper.cfg` file, under the `[output_pin CLOG_DETECTION]` & add this pin...

```
pin: PC12
```

<br>

# Add Jam Detection Override Pin!

See line 49 of the `buffer_stepper.cfg` file, under the `[output_pin JAM_DETECTION]` & add this pin...

```
pin: PC11
```


****************************************************************************************************************************

<br>

# Timelapse Use

If you wish to continue to use Timelapse be sure to add this back in your slicer's `Before Layer Change` gcode box.
```
TIMELAPSE_TAKE_FRAME
```
<br>

# PLR (Power Loss Recovery) Use

You can now use the Sovol PLR system with DEKU macros! To do this simply add

```
LOG_Z
```
To your slicer's `Layer Change` box in `Machine Gcode`

<img width="517" height="222" alt="ZLOG" src="https://github.com/user-attachments/assets/0626aa47-1335-407f-8a69-d8fd778dac18" />

Be sure to include your PLR.cfg file now!
```
[include plr.cfg]
```

Then in the demon_user_settings file near the top set

```
variable_sovol_plr: True
```

Now Save & Restart.

>[!TIP]
>Once the macros see you have set the above variable `True` they will ask you if you wish to automatically download & install all required files to use the Sovol PLR system with DEKU macros. If you click `GET` on the pop up prompt your machine will reboot to bring the new files into the system.

>[!NOTE]
>Some users have reported that using the same nozzle temperature for the first layer & the rest of the print will cause Sovol's PLR code to break & not heat your nozzle correctly during a PLR resume event!

<br>

# SV08 MAX CUSTOM EXPANSION FILE! - REQUIRED!!

>[!IMPORTANT]
>BE SURE YOU FOLLOW THIS SECTION!!!!!

>[!CAUTION]
>DAMAGE MAY RESULT IF YOU DO NOT DO THIS!!!

>[!NOTE]
>The command below MUST have at least 2 presses of the spacebar at the start of the line it's on for it to work!
>
>It must NOT be at the very start of the line! If you click the copy text button box below the correct spacing "should" be applied when you paste it in, but please check the command is correctly indented before use!

Go into the demon_custom_expansion cfg file & under the `[gcode_macro _CUSTOM_PRE_LEVEL]` section & paste in...
```
    _OFFSET_FORCE_OVERLAY
```

<img width="1333" height="648" alt="SV08_MAX FO" src="https://github.com/user-attachments/assets/4a45e883-3818-4cdc-b61c-be2ecda3f57f" />

Then be sure to set `variable_ceal_master_enable:` & the `variable_pre_level:` both to...
```
True
```

By doing this you make sure the printer has the correct Z Offset for printing! 

<br>

# Modify your Metal Cleaner Strip! - IMPORTANT!!

>[!CAUTION]
>Be sure to use bolts with low profile heads & be SURE to test your modification will not catch the nozzle or Eddy probe while the printer is in use!

Sovol placed the metal cleaner strip BELOW the surface height of your build plate. 

This fine until it isn't & will 100% cause damage if for any reason you have issue homing & the printer gets things wrong! 

So DKEU has changed this! Add 3-4 M2 washers under the strip to raise it to a safer height. DKEU is set to use the cleaner strip at this raised height!

<img width="599" height="383" alt="Max Strip" src="https://github.com/user-attachments/assets/c2b39b83-6130-42af-a547-37b64e3aecc4" />

<br>
<br>
<br>

# THE TRICKY SSH BIT!

In this section you'll modify the way your SV08 MAX deals with a couple of things, firstly when you insert filament into the auto feeder unit it'll now automatically grab the end & start feeding the filament to the extruder - you will no longer have to hit the button to start it! The button will still be fully functional as before.

Secondly the printer will now choose a random spot around the centre home location to tap the bed so it will NOT tap the same place over & over for every print!

Lastly the buffer_stepper.cfg file ties it all together & gives increased functionality especially when used with an HDMI touchscreen!

>[!IMPORTANT]
>After installing these files you'll need to comment out the `center_xy_postion` line under the `[z_offset_calibration]` section in your printer.cfg to clear an expected Klipper error. This is normal.

## Install Direct Via SSH 

Start by changing directory to:

```
cd ~/klipper/klippy/extras
```

## The first way is the safe way where these four commands will make your current file into a backup file ending in `.1` & then download the new files to use instead - RECOMMENDED!!

You need ALL FOUR of these files!

NOTE: If you have chosen not to use your filament buffer unit do not run this first command, filament_switch_sensor.py, skip to the second line.

```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/filament_switch_sensor.py --backups=1
```
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/z_offset_calibration.py --backups=1
```

```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/buffer_stepper.py --backups=1
```
```
cd ~/printer_data/config
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/buffer_stepper.cfg  --backups=1
```

Restart

```
sudo reboot now
```

<br>

## The second way is available if you simply want to overwrite your current files & not make a backup - USE WITH CAUTION!!

You need ALL FOUR of these files!

NOTE: If you have chosen not to use your filament buffer unit do not run this first command, filament_switch_sensor.py, skip to the second line.
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/filament_switch_sensor.py --backups=0
```
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/z_offset_calibration.py --backups=0
```
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/buffer_stepper.py --backups=0
```
```
cd ~/printer_data/config
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/buffer_stepper.cfg  --backups=0
```

Restart

```
sudo reboot now
```

*********************************

<br>

## Optional Manual Install - If you didn't do either of the ssh installs above

<br>

Download the `filament_switch_sensor.py`, the `z_offset_calibration.py` & the `buffer_stepper.cfg` files found here.

https://github.com/3DPrintDemon/DEMON-SV08MAX/tree/main/DEMON_SV08_MAX_REPLACEMENT_FILES

<br>

Open your chosen SFTP client & login to your SV08 MAX

Naviagate to....

```
/home/sovol/klipper/klippy/extras
```

NOTE: If you have chosen not to use your filament buffer unit skip the filament_switch_sensor.py file.

Find the `filament_switch_sensor.py` & the `z_offset_calibration.py` files already in your system & download them to keep safe as a backup!!! IMPORTANT!!!

Now upload the modified files, overwriting the current files.


Naviagate to....

```
/home/sovol/printer_data/config
```

Find the `buffer_stepper.cfg` file already in your system & download them to keep safe as a backup!!! IMPORTANT!!!

Now upload the modified files, overwriting the current files.

Restart the printer.


*********************************

<br>

# Edit Your printer.cfg 

[DON'T FORGET TO DO ALL THE OTHER STUFF IN THE GENERAL SETUP TOO!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)

>[!IMPORTANT]
>Be sure to comment out the Sovol/Mainline [save_variables] section in the printer.cfg file!!

Comment out these stock sections

```
# [idle_timeout]
# gcode: _IDLE_TIMEOUT
# timeout: 1800

# [save_variables]
# filename =/home/sovol/printer_data/config/saved_variables.cfg
```

Paste in these for use with DKEU macros!

```
[idle_timeout]
gcode:
    _DEMON_IDLE_TIMEOUT
timeout: 3600

[save_variables]
filename = ~/demon_vars.cfg
```

Be sure your `printer.cfg` file `[extruder]` section contains...

```
max_extrude_only_distance: 200
```
```
max_extrude_cross_section: 5
```

<br>

>[!IMPORTANT]
>YOU MUST, I REPEAT MUST DISABLE ALL THE SOVOL MACROS BY COMMENTING OUT THE macro.cfg FILE INCLUDE IN THE printer.cfg FILE!

Includes should look like this!

```
[include mainsail.cfg]
#[include chamber_hot.cfg]
[include buffer_stepper.cfg]
[include timelapse.cfg]
[include plr.cfg]
# [include Macro.cfg]
# [include moonraker_obico_macros.cfg]
[include ./Demon_Klipper_Essentials_Unified/*.cfg]
[include ./Demon_User_Files/*.cfg]
[include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Demon_User_Files_Handler_v*.cfg]
[include ./KAMP_LiTE/*.cfg]
[include ./Heat_Soak.cfg]
[include ./My_Macros.cfg]
```

<br>

Change the [printer] section to reduce the simply crazy stock acceleration values of 40k & add the new `minimum_cruise_ratio` parameter. Default value is 0.5, a value of 0.35 will reduce the amount of time the 
toolhead will be allowed to be at maximum speed. A value of 0.75 will allow the toolhead to stay at maximum speed longer but might lower print quality.

```
[printer]
kinematics: corexy
max_velocity: 700
max_accel: 5500      
minimum_cruise_ratio: 0.35
max_z_velocity: 20
max_z_accel: 500
square_corner_velocity: 5.0
```

<br>

Change the [resonance_tester] section to this to remove the limits added by the commented out values! This will give you the proper full test & not cut it off early as it does stock!

```
[resonance_tester]
accel_chip: lis2dw
probe_points: 250, 250, 30  
max_smoothing: 0.05
# accel_per_hz:100
# min_freq: 35
# max_freq: 45
# hz_per_sec: 1.0
```

<br>

>[!CAUTION]
> You MUST make sure you comment out the entire [homing_override] section, you dont need it as we will be using the DKEU homing system!

```
# [homing_override]
# gcode:
#    {% if not 'Z' in params and not 'Y' in params and 'X' in params %}
#      {% if printer.toolhead.homed_axes != "xyz" %}
#        G90
#        G0 Z5 F300
#      {% endif %}
#      M9928 X
#    {% elif not 'Z' in params and not 'X' in params and 'Y' in params %}
#      {% if printer.toolhead.homed_axes != "xyz" %}
#        G90
#        G0 Z5 F300
#      {% endif %}
#      M9928 Y
#    {% elif not 'Z' in params and 'X' in params and 'Y' in params %}
#      {% if printer.toolhead.homed_axes != "xyz" %}
#        G90
#        G0 Z5 F300
#      {% endif %}
#      M9928 X
#      M9928 Y
#    {% elif 'Z' in params and not 'X' in params and not 'Y' in params %}
#      G90
#      G0  X271 Y251 F9000
#      M9928 Z
#      G0  Z10 F600
#    {% else %}
#      G90
#      G0 Z5 F300
#      M9928 X
#      M9928 Y
#      G90
#      G0  X271 Y251 F9000
#      M9928 Z
#      G0  Z10 F600
#    {% endif %}
# axes: xyz
# set_position_z: 0
```

<br>

Make sure your [stepper_z] section looks like this as the stock file has the `position_min` set to -10!! this is crazy & should NOT be this much, -1.5 is much better as if you ever have a homing error the printer wont try to
plant the nozzle through the floor!

```
[stepper_z]  #z1
step_pin: PA8
dir_pin: PC9
enable_pin: !PA10
rotation_distance: 40         
gear_ratio: 80:12             
microsteps: 16
endstop_pin: probe: z_virtual_endstop
position_max: 505             
position_min: -1.5 #-10              
homing_speed: 10.0
homing_retract_dist: 5.0
homing_retract_speed: 10.0
second_homing_speed: 5.0
```

<br>

Comment out the stock Fan & LED sections!

```
# [fan_generic fan0] # front model cool fan
# pin: extra_mcu: PB0
# max_power: 1.0

# [fan_generic fan1] # back model cool fan
# pin: extra_mcu: PA7
# max_power: 1.0

# [fan_generic fan2] # auxiliary fan
# pin: PB0
# max_power: 1.0

# [fan_generic fan3] # exhaust fan
# pin: PE11
# max_power: 1.0

# [output_pin main_led]
# pin: PD13
# value: 1.0
```

Paste in these modified section for use with DKEU macros & improved function!

```
[multi_pin fan_pins]
pins: extra_mcu:PA7, extra_mcu:PB0

[fan]
pin:multi_pin: fan_pins
max_power: 1.0
shutdown_speed: 0
kick_start_time: 0.5
off_below: 0.10

[fan_generic fan2] 
pin: PB0
tachometer_pin: PB1
max_power: 1.0

[fan_generic fan3] 
pin: PE11
tachometer_pin: PE13
max_power: 1.0

[led Printer_Lights]
white_pin: PD13
cycle_time: 0.001
initial_WHITE: 1.0
```

>[!TIP]
>In Orca Slicer click the edit box on the printer name at the top of the screen to bring up the `Printer Settings` window, then in the `Basic information` tab at the very bottom under `Accessory` be sure to uncheck the `Auxiliary part cooling fan` option. This will stop Orca keeping the fans on after printing.

<br>

Next comment out the stock [heater_fan bed_fan] section as it's not the correct setup for this fan!

```
# [heater_fan bed_fan]      
# pin: PE14
# max_power: 1.0               
# kick_start_time: 0.5         
# heater: heater_bed             
# heater_temp: 35              
# tachometer_pin: PB10
# tachometer_ppr: 2
# tachometer_poll_interval: 0.001375
```

Paste in this modified section for improved function & a LOT less noise during operation! This will power the bed SSR fan only when its on & leave it for 5 minutes after its been switched off!

```
[controller_fan Bed_SSR_Fan]
pin: PE14  
max_power: 1.0               
kick_start_time: 0.5
fan_speed: 1.0
idle_timeout: 600
stepper:
heater: heater_bed
tachometer_pin: PB10
tachometer_ppr: 2
tachometer_poll_interval: 0.001375
```

<br>

# KlipperScreen Feed In & Feed Out Menu Buttons!

>[!TIP]
>Don't miss this if you're using KlipperScreen!

To add filament feed in & out buttons to the custom Demon `Prepare` KlipperScreen menu be sure you have followed [this section](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#modifying-klipperscreen-menus-for-new-features) of the main documentation & then paste these two blocks at the bottom of the original section you pasted in!

This will give you quick & easy access to control the Auto Feeder via the touchscreen!

```
[menu __main custom feed_in]
name: Feed In
icon: arrow-down
method: printer.gcode.script
params: {"script":"_FEED_IN"}

[menu __main custom feed_out]
name: Feed Out
icon: arrow-up
method: printer.gcode.script
params: {"script":"_FEED_OUT"}
```

****************************************************************************************************************************

<br>

# :gift: SUPPORT 3DPrintDemon! :gift:

You can stay a supporter on the 3DPrintDemon Patreon sending donations of your choosing for as long as you like. Maybe it’s for just a month or two for single private users that would like to show your gratitude, or maybe you could consider ongoing support if you’re a business owner & make regular use of my work to aid your business.

Active supporters have a special channel on the Demon Discord server & are provided with a higher level of support over non supporting members. Just make your discord user name known & you’ll be granted “supporter” privileges.

:red_circle: [JOIN THE 3DPRINTDEMON PATREON](https://patreon.com/3dprintdemon) as an active donating member & show your support for my work!

<br>
<br>
<br>



# ADD EXTRA UNPUBLISHED PINS FOR MORE FUNCTIONS HERE!!

Here you can find a selection of extra pins on the stock SV08 MAX mainboard for expanding your system!

- 1x disable/enable clog detection switch
- 2x thermistor pins, great for chamber & case sensors!
- 3x digital output pins, gcode buttons or I/O sensor pins @3.3v
- 2x chains of multicolour neopixel LED chains!

## :red_circle: [HOOK ME UP!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_Extended_Pins.md)

<br>

*********************************

- [Head on to General Setup For All Printers](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)
