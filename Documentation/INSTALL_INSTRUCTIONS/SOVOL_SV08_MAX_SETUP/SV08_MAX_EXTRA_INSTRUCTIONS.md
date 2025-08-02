# IF YOU'RE USING A SOVOL SV08 MAX PRINTER!

<br>

>[!NOTE]
>When complete the printer will give you some unknown command errors relating to the commented out plr.cfg file. This is because Sovol have hardcoded these commands into Klipper/Moonraker & I am yet to find where they're being called from! Once I find the source of the calls I'll update things. In the meantime these messages can safely be ignored. 

<br>

****************************************************************************************************************************
### IF YOU RAN V1.0-V2.8 BE SURE TO UPDATE YOUR SLICER'S START GCODE OR NEW FEATURES WONT WORK!
**Also you must update ALL the macro files as this new version will NOT work correctly with old files!**
****************************************************************************************************************************

- ### [UPDATING FROM A PREVIOUS VERSION CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)


****************************************************************************************************************************

### Orca Slicer

Make sure you have the latest 2.2.0 (beta2 or later) version of Orca Slicer DO NOT USE ORCA SLICER DOT NET!!! BAD!!!

This link GOOD!

- https://github.com/SoftFever/OrcaSlicer/releases

******************************

<br>

# MAIN SSH INSTALLER HERE:
### RUN FROM YOUR SSH TERMINAL TO START YOUR FULL INSTALL!

>[!IMPORTANT]
>It is highly recommended to use this installer if you're installing fresh or updating from an older version and are not using Moonraker's Update Manager! It will archive your old files for you.

RUN THIS FIRST:
```
wget -O - https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Install_Script/Demon_Klipper_Essentials_Installer.sh | bash
```

<br>

# PREREQUISITE INSTALLERS HERE:

Run from your SSH terminal to install your prerequisites. This script will ask you your prerequisite install choices. 

```
sh ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_Prerequisites_Installer.sh
```
****************************************************************************************************************************

<br> 

# ...Your new files should now be Installed! 

Your new files should now be available to you on your printer! Please note you may need to reload your `Mainsail` browser page for new items to show correctly.

>[!NOTE]
>Don't forget to reload your web browser window so new items will show & work correctly after installation!

>[!IMPORTANT]
>DO NOT include the new files just yet as there's some important stuff to do first!

<br>

- [Other ways to install are here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/Other_Ways_To_Install.md)

<br>

****************************************************************************************************************************
### You need to complete everything in the [General Setup For All Printers](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#the-file-structure-has-changed-for-v294-onwards) as well!

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

### FEATURE: DEMON DIAGNOSTICS!

>[!TIP]
> BE SURE TO USE THIS WHEN SETTING UP! It's your onboard helper tool!
>This system will help you see whats been done, what needs doing & what is not correctly set yet!

<details>
    <summary>
        <b>
        Click to expand - FEATURE: DEMON DIAGNOSTICS!
        </b>
    </summary>
<p>
</p>
Once you have installed the main files this is an awesome new adaptive script (run from ssh) that will revolutionise your Demon_Klipper_Essentials_Unified install process! 
Each time you run it the utility will scan your system in its current state & it'll show you your progress with getting everything setup, think of it as your installation copilot, or your own little red devil on your shoulder! 

### RUN FROM YOUR SSH TERMINAL WITH THIS COMMAND!
```
sh ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Diagnostics/Demon_Diagnostics.sh
```

The script will tell you exactly what you currently have defined, included & installed at the time of the system scan! It'll also tell you if there's something not defined, or if there's something missing. It will tell you if a file is installed but not included or even if it's been defined/included multiple times! 

Your ssh terminal will tell you what you need to do to complete the install correctly & not miss anything. It'll warn you if anything is wrong.
Run it at each stage of your install as many times as you like to make sure you're getting everything done! 

### The goal is to make as many GREEN lines as possible!

The utility will scan & evaluate your printer.cfg & moonraker.conf files to check how you're doing & to make sure you don't miss anything that's needed by the macros.

![DD-2](https://github.com/user-attachments/assets/8af1ef75-73ff-49db-b9c7-2bd7fb704ccb)


The system will also give you big red warnings with clear explanations when things are not correct!

![DD-3](https://github.com/user-attachments/assets/1ad99cc6-6008-413c-9250-b9a2f45d3b7c)


NOTE THIS SCRIPT MAKES NO CHANGES TO ANY OF YOUR FILES 

It just scans them safely & leaves them unedited & unchanged!

</details>

![DD-1](https://github.com/user-attachments/assets/24fcda75-5418-4b3f-95c1-73c2197f6e45)

>[!NOTE]
>This diagnostic tool is extremely strict & will not allow hashed out comments or white space (spaces) after any printer.cfg sections or include commands. Keep this in mind if you can't turn a section green!



****************************************************************************************************************************

<br>

# Timelapse Use

If you wish to continue to use Timelapse be sure to add this back in your slicer's `Before Layer Change` gcode box.
```
TIMELAPSE_TAKE_FRAME
```
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
max_extrude_only_velocity: 15
```
```
max_extrude_cross_section: 5
```
This is used by the load/unload macros & is converted into feedrate of mm/s & is limited to 20.

<br>

>[!IMPORTANT]
>YOU MUST, I REPEAT MUST DISABLE ALL THE SOVOL MACROS BY COMMENTING OUT THE macro.cfg FILE INCLUDE IN THE printer.cfg FILE!

Includes should look like this!

```
[include mainsail.cfg]
#[include chamber_hot.cfg]
[include buffer_stepper.cfg]
[include timelapse.cfg]
# [include plr.cfg]
# [include Macro.cfg]
# [include moonraker_obico_macros.cfg]
[include ./Demon_Klipper_Essentials_Unified/*.cfg]
[include ./Demon_User_Files/*.cfg]
[include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_Sovol.cfg]
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
pin: PE11
tachometer_pin: PE13
tachometer_ppr: 1
tachometer_poll_interval: 0.0075
max_power: 1.0

[fan_generic fan3] 
pin: PB0
tachometer_pin: PB1
tachometer_ppr: 1
tachometer_poll_interval: 0.0075
max_power: 1.0

[output_pin Printer_Lights]
pin: PD13
pwm: 1
value:1.0
cycle_time: 0.01
shutdown_value: 0
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

****************************************************************************************************************************

<br>

# OK NOW THE TRICKY SSH BIT!

In this section you'll modify the way your SV08 MAX deals with a couple of things, firstly when you insert filament into the auto feeder unit it'll now automatically grab the end & start feeding the filament to the extruder - you will no longer have to hit the button to start it! The button will still be fully functional as before.

Secondly the printer will now choose a random spot around the centre home location to tap the bed so it will NOT tap the same place over & over for every print!

Lastly the buffer_stepper.cfg file ties it all together & gives increased functionality especially when used with an HDMI touchscreen!

## Install Direct Via SSH 

Start by changing directory to:

```
cd ~/klipper/klippy/extras
```

## The first way is the safe way where these three commands will make your current file into a backup file ending in `.1` & then download the new files to use instead - RECOMMENDED!!

You need ALL THREE of these files!
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/filament_switch_sensor.py --backups=1
```
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/z_offset_calibration.py --backups=1
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

You need ALL THREE of these files!
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/filament_switch_sensor.py --backups=0
```
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/z_offset_calibration.py --backups=0
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

## Optional Download & Manual Install

<br>

Download the `filament_switch_sensor.py`, the `z_offset_calibration.py` & the `buffer_stepper.cfg` files found here.

https://github.com/3DPrintDemon/DEMON-SV08MAX/tree/main/DEMON_SV08_MAX_REPLACEMENT_FILES

<br>

Open your chosen SFTP client & login to your SV08 MAX

Naviagate to....

```
/home/sovol/klipper/klippy/extras
```

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

- [Head on to General Setup For All Printers](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)
