
# VERSION 2.9

There’s been a huge amount added & optimised in this update! Stuff you really won’t want to miss out on!

Fully integrated Eddy Probe support for use as a probe & Z endstop! 
Simply install your Eddy Probe & add the BTT sample configs & the Demon macros will detect your probe type & adapt all probing & meshing functions to suit Eddy!
You will however still need to follow the very quick & simple instructions to get the btt_eddy.cfg ready on the BTT Github.
https://github.com/bigtreetech/Eddy
All Demon Z_Probe calibration, machine meshing & machine levelling macros all now automatically detect & support BTT Eddy Probe!
Just hit go & it’ll do its thing!

Orca Adaptive Pressure Advance awareness function!
If you’re using Demon APA & want to try Orca APA then even if you leave the Demon APA settings active the printer can detect files with Ocra APA & will automatically disable the Demon APA so you know the two systems will NOT ever clash!

PRINT_START HEAT SOAK TOGGLE!!
Don’t need the heat soak? No problem just click the HEATSOAK_TOGGLE button before you start a print! One press turns heat soaks off, a second press & they are turned back on! It will remain in whatever state you leave it until you change it or Klipper is restarted!
This will totally skip all PRINT_START heat soaks including any TEMPERATURE_WAITS for the print chamber if you have a chamber sensor/fam defined!
Not only that the same toggle button is now available in the Klipperscreen Prepare menu too!

PRINT_START HEATSOAK TIMERS 
This macro button lets you define the length of your PRINT_START heat soak until you change it or Klipper is restarted.

PRINT_START QUICK SETTINGS READBACK
Handy for seeing your adjusted settings that are in active RAM & not the saved values defined in the settings file!

DEMON HOMING CONTROLl! - COMPATIBLE WITH BBT EDDY PROBE!
Fully customisable homing system that will never home the printer when the nozzle is less than 5mm off the bed! It will always raise so no more homing actions at Z0.24!!! Thats some scary stuff! Also no more collisions with nozzle cleaners or bed clips/guiders!! Yay!
This system automatically sees what drivers you have installed & lets you reduce the homing motor current your printer uses without needing to edit the macro files at all, unlike other popular files! Currently it supports 7 common driver types. TMC2208, TMC2209, TMC5160, TMC2225, TMC2226, TMC2130, TMC2240, TMC2660.
The system is fully customisable within the Demon User Settings file, it even has a high current safety feature that’ll stop you setting the current too high & inadvertently causing damage to your printer! …& yes you can choose to override it if you wish! Be sure to comment out any old sensorless homing macros or homing override sections you might have.

PLUS! - The system automatically knows if you have a BTT Eddy probe & it’ll know if you’re using it as a Z endstop or not & will adapt itself to it! No changes required!!!

User settings are:
override_home_power_safety
home_power
axis_backoff_speed
axis_backoff_distance
axis_register_clear_wait
move_to_z_endstop_speed
z_endstop_loaction_x
z_endstop_loaction_y

There’s also been some great additions in new macros too!

Z_ASCENDER
This is designed for quick & small raises in Z height especially when the printer is NOT homed! For example if/when you have a stoppage or system failure, or if you want to change your bed but the printer is not homed & all you need is to raise the toolhead without homing, this is really handy if the build plate is full! 
It works both when the printer is not homed & when it is! Maximum raise is 100mm per activation. Must be used with caution!! 
Warning message in console when used for more info.

QUICK_MESH - Compatible with Eddy Probe!
Build a quick & dirty mesh at current temps. It will NOT level your machine first!! Compatible with Eddy Probe!
Allows you to name the mesh in the macro button dropdown menu!

HOT_MESH - Compatible with Eddy Probe!
Don’t be a hot mess! Build an accurate mesh with the proper full process. Compatible with Eddy Probe!
This macro will heat your printer to your chosen temperatures, home it, do a levelling process (QGL etc), let you choose if you want to run a heat soak & for how long!
It also allows you to name the mesh all in the macro button dropdown menu!

DEMON_IDLE_TIMEOUT
This system utilises the fantastic Mainsail.cfg & gives you 2 separate idle timeout behaviours, with 2 different timescales for each timeout, one when printing & one when not! It lets you choose how your system deals with idle timeouts! 
You choose if you want an infinite pause while printing where it’ll simply move to the chosen pause parking position, stop the parts fan, kill the hotend heater & wait indefinitely for you to continue the print! Or you can choose the default behaviour & have a print cancelation after a definable time, then you can opt for the printer to cool itself down & initiate a full printer shutdown too if you want, with use of a power relay.
Then when not printing you can have a second much longer idle timeout specified where it’ll do the standard motors & heaters off, or you can choose to add a printer cool down & the shutdown when used with a power relay. 

So for example you can have the printing idle timeout set for 5 minutes after parking & pausing where the printer will kill the parts cooling fan & hotend heater, it’ll then wait all night with the motors engaged & bed heater on for you to get up in the morning & change the filament & continue the print!

But then… When not printing you can have it set to wait a full hour or more with motors & heaters on & then if you forget about it it’ll timeout & cool itself down & turn itself off!
How cool is that!!?!

DEMON_PAUSE
Lets you choose to automatically pause & resume your parts fan on pausing a print!

DEMON_CANCEL
Runs some basic settings stuff to help the cancelled print & get you ready for the next one.

DEMON_RESUME
Lets you automatically resume all system parts cooling/nevermore/chamber fans as well as the chamber heater!

FILAMENT_CHANGE_PARK
Now not only can you have a standard park on pause location, & a totally different park on cancel location thanks to the amazing Mainsail.cfg features you can now also have a special filament change parking spot too!! Not only that if your print is below your chosen Z height the printer will raise itself up away from its current low location & wait for you to make the filament change & then it’ll move back down to the print after resuming. 
Add the new macro call “FIL_CHANGE_PARK” to your slicer’s filament change Gcode box & have the printer park in your chosen spot ready for you to activate an unload/load process, this is not an auto unloader. The system will also run your chosen printing timeout laid out above. 



There’s also been many other updates too! Little things here & there, all good stuff.

Like the Power relay macros now give you options to simply cut power to the client (the printer itself) & leave the host running if you have a separated system (print mcu & Rpi), or if its the case where you have an all-in-one system like a BTT Manta mainboard or a machine like an SV08 with stock mainboard you can command the system to safely shut the host (your pi/board running Klipper) down first which will then in turn automatically cause the power relay to open & shut down the printer too!

MACHINE_LEVEL_HOT - Compatible with Eddy Probe!
Got an option to include an adjustable heat soak timer or not! Compatible with Eddy Probe!

AUTO_MESH_BUILDER - Compatible with Eddy Probe!
Is remade! Now choose which meshes to build, if you want heat soaks or not, set your heat soak timers if you do, then if you have a chamber sensor/fan the macro will automatically use TEMPERATURE_WAIT instead of timers & you can set your temperature thresholds for it directly in the mainsail interface along with all the other options! Compatible with Eddy Probe!

PID TUNE MODE 
Got remade! Now choose Which tests to run directly in the mainsail interface! Enter yes or no for choices

STEPPER BUZZ CYCLE 
Got remade! Now choose which steppers to buzz directly from the mainsail interface! Enter yes or no for choices

HEATSOAK TOGGLE! 
There’s a new option to set the heat soaks on and off both in the Mainsail interface & the PREPARE menu on Klipperscreen! 
It’s a toggle button so one push turns heat soaks off, another push turns them back on! 

PRINT START HEATSOAK TIMERS
Now your timers can be set directly In the Mainsail interface!

PRINT START QUICK SETTINGS READBACK
See the current state of these settings in console

READY UP CUSTOM 
Ready your printer by setting the nozzle & bed temperature, your chamber fan threshold, your idle timeout & if you want to park over the bed or not if you’re using a printer with a Voron style Z endstop switch!

REMOVE ORCA MULTI SURFACE OFFSET MODIFER
If you run a print where you use a different bed that has an Orca multi surface offset modifier set & don’t change the Z offset during the print the system will then remove that modifier offset automatically. 

AUTO EMERGENCY STOP (AES) System integration
The Demon AES System has been integrated into the new HOMING CONTROL & once setup as per instructions on your Z endstop switch enabled printer it can be enabled in the demon_user_settings file & will be ready to save your printer from damage if its ever needed!

PREPARE Klipperscreen Menu
New menu items added to your Klipperscreen!

