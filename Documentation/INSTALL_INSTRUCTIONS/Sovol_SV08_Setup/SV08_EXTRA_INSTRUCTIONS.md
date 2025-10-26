# IF YOU'RE USING A SOVOL SV08 PRINTER!

<br>


****************************************************************************************************************************
### You need to complete everything in the [General Setup For All Printers](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#the-file-structure-has-changed-for-v294-onwards) first!

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

# SOVOL SV08 EDDY UPGRADE KIT USERS!

>[!IMPORTANT]
>TEMPORERY WORKAROUND
>
>Unitl I can update some systems within the macros you'll need to add the below commands, it will not make use of the nozzle scraper just yet, please watch this space.

You must paste this into the demon_custom_expansion file under the commands in the pre-levelling macro. Remember to enable it & the master enable at the top of the file.

```
    _Z_PARK
    SET_HEATER_TEMPERATURE HEATER=extruder TARGET=150
    TEMPERATURE_WAIT SENSOR=extruder MINIMUM={150 -2} MAXIMUM={150 + 5}

    Z_OFFSET_CALIBRATION METHOD=force_overlay EXTRUDER_TEMP=150 BED_TEMP={printer.heater_bed.target}
    M400
    G0 Z10
```
****************************************************************************************************************************

<br>

# REGULAR INSTRUCTIONS

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

<br>

# Edit your printer.cfg 

[DON'T FORGET TO DO ALL THE OTHER STUFF IN THE GENERAL SETUP TOO!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)

>[!IMPORTANT]
>Be sure to comment out the Sovol/Mainline [save_variables] section in the printer.cfg file!!
>
>If you don't do this & you use the `Demon_User_Files_Updater` G-code shell command extension it will cause looping behaviour asking to extract files on restarts! You must define the Demon one ONLY!

Comment out - Stock Sovol...

```
# [save_variables]
# filename =/home/sovol/printer_data/config/saved_variables.cfg
```
Comment out - Mainline...
```
# [save_variables]
# Filename = ~/printer_data/config/saved_variables.cfg
```
Add this to your `printer.cfg` BEFORE you include the macros. 

>[!IMPORTANT]
>Be sure to comment out any other [save_variables] already in your printer.cfg, if you don't the system can't update the demon_vars.cfg variable file.

```
[save_variables]
filename: ~/demon_vars.cfg
```
<br>

Now be sure to include these...
```
[include ./KAMP_LiTE/*.cfg]
[include ./Heat_Soak_Sovol_SV08.cfg]
[include ./RGB_LEDs.cfg]

# FOR SOVOL KLIPPER UNCOMMENT LINE BELOW 
# [include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_Sovol.cfg]

# FOR MAINLINE UNCOMMENT LINE BELOW 
# [include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_Biqu.cfg]
```

Be sure your `printer.cfg` file `[extruder]` section contains...

```
max_extrude_only_velocity: 15
```
```
max_extrude_cross_section: 5
```
This is used by the load/unload macros & is converted into feedrate of mm/s & is limited to 20

```
[idle_timeout]
gcode:
    _DEMON_IDLE_TIMEOUT
timeout: 3600
```

This will call the new Demon timeout macro after 1 hour & execute the functions of your choice in the demon_user_settings file. You csan set the time (seconds) to anything you like.

<br>

>[!IMPORTANT]
>YOU MUST, I REPEAT MUST DISABLE ALL THE SOVOL MACROS BY COMMENTING OUT THE macro.cfg FILE INCLUDE IN THE printer.cfg FILE!

To do this use a # at the start of the line like this:
```
# [include Macro.cfg]
```
<br>

Then set your fans like this in the printer.cfg file:
```
[multi_pin fan_pins]
pins: extra_mcu:PA7, extra_mcu:PB1

[fan]
pin:multi_pin: fan_pins
max_power: 1.0
shutdown_speed: 0
kick_start_time: 0.5
off_below: 0.10
```
Comment out the stock entry do not delete it, it must look like this:
```
# [fan_generic fan0] # back model cooling fan
# pin: extra_mcu:PA7
# max_power: 1.0

# [fan_generic fan1] # front model cooling fan
# pin: extra_mcu:PB1
# max_power: 1.0
```
>[!TIP]
>In Orca Slicer click the edit box on the printer name at the top of the screen to bring up the `Printer Settings` window, then in the `Basic information` tab at the very bottom under `Accessory` be sure to uncheck the `Auxiliary part cooling fan` option. This will stop Orca keeping the fans on after printing.

<br>

Rename the `[output_pin Main_LED]` section & change the cycle_time. As the stock value of `5` is incorrect. 

```
[led Printer_Lights]
white_pin: PA3
cycle_time: 0.001
initial_WHITE: 1.0
```


Be sure to comment out the Sovol [homing_override] section if you want to use the demon_homing_control file. If not leave this commented in & disable the demon file by commenting out its full content.

```
# [homing_override]
# gcode:
#    {% if not 'Z' in params and not 'Y' in params and 'X' in params %}
#      G28 X
#      G0 X348 F1200
#    {% elif not 'Z' in params and not 'X' in params and 'Y' in params %}
#      G28 Y
#      G0 Y360  F1200
#    {% elif not 'Z' in params and 'X' in params and 'Y' in params %}
#      G28 Y
#      G0 Y360  F1200
#      G4 P2000
#      G28 X
#      G0 X348  F1200
#    {% elif 'Z' in params and not 'X' in params and not 'Y' in params %}
#      G90
#      G0  X191 Y165 F3600
#      G28 Z
#      G0  Z10 F600
#    {% else %}
#      G90
#      G0 Z5 F300
#      G28 Y
#      G0 Y360  F1200
#      G4 P2000
#      G28 X
#      G0 X348  F1200
#      G90
#      G0  X191 Y165 F3600
#      G28 Z
#      G0  Z10 F600
#    {% endif %}
# axes: xyz
# set_position_z: 0
```

<br>

Now... There's one more thing I really recommend doing & that's modifying the settings below for your meshing & probing sections! This will improve the accuracy of your system when using the probe. Do check these values against your current values & DO NOT overwrite your stock sections!! Comment them out & paste these in below them so you can always go back if you need to!

THIS FIRST SECTION IS OPTIONAL TO SLOW THE MACHINE DOWN - as the stock settings are waaaaaaaaay too fast & are unrealistic.
```
[printer] 
kinematics: corexy
max_velocity: 700
max_accel: 8200
minimum_cruise_ratio: 0.5
max_z_velocity: 20
max_z_accel: 500
square_corner_velocity: 5.0
```
 
```
[probe]
pin: extra_mcu:PB6
x_offset: -17
y_offset: 10
# z_offset: 0 
speed: 5
samples: 3
samples_result: median
sample_retract_dist: 5.0
lift_speed: 50
samples_tolerance: 0.01
samples_tolerance_retries: 10
```
 
```
[bed_mesh]
speed: 350                   
horizontal_move_z: 5         
mesh_min: 10,10              
mesh_max: 333,340            
probe_count: 11,11             
algorithm: bicubic   
bicubic_tension: 0.4
split_delta_z: 0.01
mesh_pps:3,3
adaptive_margin: 5
fade_start: 0
fade_end: 10
fade_target: 0
```
 
```
[quad_gantry_level]
gantry_corners:              
	-60,-10
	410,420
points:
	36,10
	36,320
	346,320
	346,10
speed: 350                   
horizontal_move_z: 5       
retry_tolerance: 0.01      
retries: 5                  
max_adjust: 10  

```

<br>

# Mainline users

You will need to add these sections to your printer.cfg if they're not defined already. 

```
[board_pins]
aliases:
    # EXP1 header
    EXP1_1=PA8,   EXP1_2=PC9,
    EXP1_3=PA10,  EXP1_4=PA9,
    EXP1_5=PC11,  EXP1_6=PC10,
    EXP1_7=PD8,   EXP1_8=PC12,
    EXP1_9=<GND>, EXP1_10=<5V>,

    # EXP2 header
    EXP2_1=PB14,  EXP2_2=PB13,
    EXP2_3=PC7,   EXP2_4=PB12,
    EXP2_5=PC6,   EXP2_6=PB15,
    EXP2_7=PC8,   EXP2_8=<RST>,
    EXP2_9=<GND>, EXP2_10=<5V>

[display]                    
lcd_type: uc1701
cs_pin: EXP1_3
a0_pin: EXP1_4
rst_pin: EXP1_5
encoder_pins: ^EXP2_5, ^EXP2_3
click_pin: ^!EXP1_2
contrast: 63
spi_software_miso_pin: EXP2_1
spi_software_mosi_pin: EXP2_6
spi_software_sclk_pin: EXP2_2

[neopixel Screen_Colour]     
pin: EXP1_6
chain_count: 3
color_order: RGB             
initial_RED: 0.5             
initial_GREEN: 0.4           
initial_BLUE: 0.7  
```

****************************************************************************************************************************

<br>

## OPTIONAL INSTALL for stock system!!
![DEMON_Armbian_Boot](https://github.com/user-attachments/assets/a3d92371-929e-4850-b05f-acfaed6575ba)


- [HDMI DEMON Boot Screen!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/DEMON_Armbian_HDMI_Boot_Screen/DEMON_HDMI_Boot_Screen_Install.md)

## Other Great Upgrade Options For All SV08's
Here is my SV08 nozzle cleaning & purge bucket!

- https://www.printables.com/model/873006-sovol-sv08-silicone-nozzle-cleaner-purge-bucket-mi

Anti-vibration feet

- https://www.printables.com/model/867321-sovol-sv08-low-profile-vibration-isolation-feet

M12 Probe mount

- https://www.printables.com/model/870302-sovol-sv08-m12-inductive-probe-mount-lj12a3-4-zax

DIN rail mount

 - https://www.printables.com/model/867676-sovol-sv08-recessed-din-rail-mount-bracket

****************************************************************************************************************************


- [Head on to General Setup For All Printers](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)
