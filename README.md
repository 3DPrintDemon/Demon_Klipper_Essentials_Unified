************************************
- ### [UPDATING FROM A PREVIOUS VERSION CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)
************************************

![DEMON](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/c2bae2ee-be37-48ea-b6ac-c2c32e661751)
 
# Welcome to 3DPrintDemon DEVILISHLY GOOD Klipper macros!

The very latest UNIFIED version for these macros! Huge re-implementation & new Features! 

# NOW WITH FULL BTT EDDY SUPPORT!!!

## Release version 2.9, still 100% ai Free!

A lot of time, love, coffee & lack of sleep testing has been poured into these macros! They have all been written 100% by a human! 

No ai has been used to create them! 

**Made to make your printing life easier & your printer SMARTER!**




# This UNIFIED version will run on almost any COREXY or BED SLINGER (cartesian) Klipper printer with no changes needed to the macro files! 
Small user setting changes will be required of course.

These macros have been developed for use on almost anything from Voron printers to an Ender3, & anything else in between! They will check what sort of machine you have & try to adapt themselves to it automatically!

So for example if you hit `MACHINE_LEVEL` on a COREXY printer you'll get a `QUAD_GANTRY_LEVEL`, but if you do the same on a bed slinger you'll get a `Z_TILT_ADJUST` - if your printer has that feature enabled! Plus now once the new variable `use_manual_levelling` is enabled that same macro button wil provide you `bed_screws` or `screws_tilt_calculate` functions & bypass any auto levelling calls! Same macro button but different function! Also there is a built in smart park, where the printer knows if you have a probe based Z endstop or a switch & will adjust the parking height during macro events to suit your system! Further hardware options are manually selectable in the user settings file.

Checks & Error Handling. This is a big problem for many users, you get an error in klipper but its written in "code" so you cant tell what it means! Here I have tried to explain all errors that occur while running the macros clearly. Sadly I cant help the "encoded" system ones! They'll still be hard to read!

# These macros rely on you setting the correct filament type in your slicer! BE SURE YOU DO THIS!

*NOTE: This version is a totally new approach to these macros & therefore have only been tested on my machines, while every effort has been made to make sure they work well there could well be a few bugs that need squashing! So please be sure to report anything that doesn't work correctly or errors you come across. However if you're able please try to solve the issue yourself first & let me know your solution so I can merge it. Thanks all!*

# Introduction

These macros are smart & have adaptive properties & will shape themselves to what you’re printing. 
For example the macros know if your printer is CoreXY or bed slinger, they know if it's already homed so wont home it again, & can not only automatically shape itself to simple things like your printer’s bed size & what temperatures you’re printing at! Plus it can automatically choose & load the correct mesh for the temperature of your print, as your bed will slightly change shape the hotter it gets. 

Not only that but it will choose the correct settings for your chamber cooling system, & it will even check to see if you have filament loaded before starting a print! …We’ve all done that one haven’t we, be honest!!

Also it can decide if your chamber needs to be heat soaked or not before the print starts! This is fantastic for saving time, money & electricity between back-to-back prints where the system doesn’t require heat soaking as it’s already up to temperature!! 

You have all this plus step by step adaptive on screen messages on any Mainsail web interface & KlipperScreen system so you know exactly what your machine is deciding to do at any time! Some macros can be customised by changing the settings in the macro button options before you manually call the macro in the Mainsail or KlipperScreen interfaces!

It doesn't end there, as all these features are user customisable within the `demon_user_settings_v2.8.cfg` file! Some functions can be totally deactivated entirely & bypassed with a simple changing an option from `True` to `False`! This is very useful if your printer doesn’t have the hardware components installed at this time but leaves the configuration easily customisable with a few keystrokes in the future if you want to add to your machine!

With the `_GOODNIGHT` macro you can even flick a GUI switch in Mainsail to let the printer know you want it to auto power down after it’s finished printing!! 
This can be done at ANY point during the print! You can even change your mind & cancel the auto shutdown at any point before the print completes!

**NOTE: Additional hardware & setup is required for this feature to work! How to do this is explained further on.**


A macro pack features list is here....

- #### [FEATURES LIST](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Features/Features.md)

Macro pack version update history is here....

- #### [UPDATE HISTORY](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Update%20History/Update_History.md)
- #### [CHANGELOG](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Update%20History/Demon_Changelog.md)


**Retraction Calibration...**
The `_RET_CALI_START` macro is used when calibrating your retraction settings with files generated at:

- http://www.retractioncalibration.com/

All you need do is paste `_RET_CALI_START` into the website's "Custom Gcode" box next to the green "Generate Gcode" button
This is without a doubt the absolute BEST retraction test out there!

**Nozzle Cleaning & Purge Buckets...**
The `CLEAN_NOZZLE`, `LOAD_CLEAN`, & `UNLOAD_CLEAN` macros are for use with a nozzle cleaning brush found here:

For VORON 2.4 printers

- https://www.printables.com/model/201999-nozzle-scrubber-with-a-little-bucket-for-voron-24

For SV08 Printers

- https://www.printables.com/model/873006-sovol-sv08-silicone-nozzle-cleaner-purge-bucket-mi
 
****************************************************************************************************************************
## All sounds great right!? Ok well here’s the tricky bit! 
…Well its not that tricky because I got it all written down here for you to just copy/paste into your setup!

**PLEASE CHECK ALL INSTRUCTIONS CAREFULLY!**

**Don’t just install & run the macros & wonder why they don’t work! They WILL need setting up once on your system. Damage to your machine may result if the macros are run without the prerequisites or without the correct setup before first use!** 

You will need to edit your slicer's `Start G-code` & `End G-code` boxes to get the `PRINT_START` macro to work correctly. 

****************************************************************************************************************************


# FULL INSTALL INSTRUCTIONS...

************************************
- ### [UPDATING FROM A PREVIOUS VERSION CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)
************************************

- [Be sure to check out all the new macros & how to use them!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Update%20History/Update_History.md)

## Stuff you need to install BEFORE these macros can work - DO NOT SKIP THIS!

- [PREREQUISITES - DONT NOT SKIP THIS!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Prerequisites/Prerequisites.md)

## Full install & setup instructions...

- [GENERAL SETUP FOR ALL PRINTERS](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)

## If you're using a Sovol SV08 printer 

- [SOVOL SV08 SETUP](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Sovol_SV08_Setup/SV08_EXTRA_INSTRUCTIONS.md)

You need to do this as well as the general setup for all printers above...

****************************************************************************************************************************

## Orca Slicer Heads-up!
If you get the error in the photo below it means your version is not v2.2.0 (beta or beta2 or later)
PLEASE UPDATE YOUR SLICER! 

DO NOT USE ORCA SLICER DOT NET!!! ....BAD!!!

This link GOOD!

- https://github.com/SoftFever/OrcaSlicer/releases


![Orca Fail](https://github.com/user-attachments/assets/2fd3bbf6-2c4b-4e89-ba27-5bf112cbd179)

****************************************************************************************************************************


# WANT MORE...??
Whats that I hear you cry, you want more?! Ok I got you covered!

How about fully automated power on/off control with auto cool down & shutdown after a print finishes?! Plus have full control even after Klipper is in shutdown! What is this black magic?!!!

Find out here!

- https://github.com/3DPrintDemon/BTT-Relay-v1.2-Moonraker_INSTANT_Power-On-Button

Or maybe you're using a printer with a bedside mounted Z endstop switch & sensorless homing & you want an AUTO E STOP system so that if your nozzle misses your endstop switch the printer knows there's a problem!

- https://github.com/3DPrintDemon/Voron_2.4_AES_System_Auto_Emergency_Stop_For_Z_Endstop_Switch

If thats not enough how about creating your very own online auto updating backup of all your config files here on Github in your own private repo?!

- https://github.com/3DPrintDemon/Auto_Backup_Your_Klipper_Printer
