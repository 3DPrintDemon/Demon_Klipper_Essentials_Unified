************************************
- ### [UPDATING FROM A PREVIOUS VERSION CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)
************************************

![DEMON](https://github.com/user-attachments/assets/e3f166b4-200b-400f-a5d0-64d879cf33d5)

 
# Welcome to 3DPrintDemon DEVILISHLY GOOD Klipper macros! 

>[!NOTE]
>We suffered a small disruption but the repo has been restored from local backups! 11111


## NOW WITH FULL BTT EDDY SUPPORT!!!

A lot of time, love, coffee & lack of sleep testing has been poured into these macros! They have all been written 100% by a human! Fully ai code Free! No ai has been used to create them! 

**Made to make your printing life easier & your printer SMARTER!**

<br>

# These macros will run on almost any COREXY or BED SLINGER (cartesian) Klipper printer with no changes needed to the macro files! 
Small user setting changes will be required of course.

These macros have been developed for use on almost anything from Voron printers to an Ender 3, & anything else in between! They will check what sort of machine you have & try to adapt themselves to it automatically!

So for example if you hit `MACHINE_LEVEL` on a COREXY printer you'll get a `QUAD_GANTRY_LEVEL`, but if you do the same on a bed slinger you'll get a `Z_TILT_ADJUST`.

Checks & Error Handling. Clear & easy to read messages

<br>

>[!IMPORTANT]
>These macros rely on you setting the correct filament type in your slicer! BE SURE YOU DO THIS!

<br>

# Introduction

These macros are smart & have adaptive properties & will shape themselves to what you’re printing. 
For example the macros know if your printer is CoreXY or bed slinger, they know if it's already homed so wont home it again, & can not only automatically shape itself to simple things like your printer’s bed size & what temperatures you’re printing at! Plus it can automatically choose & load the correct mesh for the temperature of your print, as your bed will slightly change shape the hotter it gets. 



A macro pack features list is here....

- #### [FEATURES LIST](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Features/Features.md)

Macro pack version update history is here....

- #### [CHANGELOG](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Update%20History/Demon_Changelog.md)

****************************************************************************************************************************

<br>

# All sounds great right!? Ok well here’s the tricky bit! 
…Well its not that tricky because I got it all written down here for you to just copy/paste into your setup!

**PLEASE CHECK ALL INSTRUCTIONS CAREFULLY!**

>[!CAUTION]
>Don’t just install & run the macros & wonder why they don’t work! They WILL need setting up once on your system. Damage to your machine may result if the macros are run without the prerequisites or without the correct setup before first use!

You will need to edit your slicer's `Start G-code` & `End G-code` boxes to get the `PRINT_START` macro to work correctly. 

****************************************************************************************************************************

<br>

# FULL INSTALL INSTRUCTIONS...

<br>

- ### [UPDATING FROM A PREVIOUS VERSION CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)


<br>

## Stuff you need to install BEFORE these macros can work - DO NOT SKIP THIS!

- [PREREQUISITES - DONT NOT SKIP THIS!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Prerequisites/Prerequisites.md)

<br>

## Full install & setup instructions...

- [GENERAL SETUP FOR ALL PRINTERS](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)

****************************************************************************************************************************

<br>

## Orca Slicer Heads-up!
If you get the error in the photo below it means your version is not v2.2.0 (beta or beta2 or later)
PLEASE UPDATE YOUR SLICER! 

DO NOT USE ORCA SLICER DOT NET!!! ....BAD!!!

This link GOOD!

- https://github.com/SoftFever/OrcaSlicer/releases

![Orca Fail](https://github.com/user-attachments/assets/873834af-e9ce-4632-af02-4e3ea133071a)

****************************************************************************************************************************

<br>

# WANT MORE...??
Whats that I hear you cry, you want more?! Ok I got you covered!

How about fully automated power on/off control with auto cool down & shutdown after a print finishes?! Plus have full control even after Klipper is in shutdown! What is this black magic?!!!

Find out here!

- [Auto Shutdown Relay!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#auto-shutdown-moonraker-power-device)

Or maybe you're using a printer with a bedside mounted Z endstop switch & sensorless homing & you want an AUTO E STOP system so that if your nozzle misses your endstop switch the printer knows there's a problem!

- [Voron 2.4 Auto Emergency Stop System (AES)](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/tree/main/Documentation/INSTALL_INSTRUCTIONS/Voron_2.4_AES_System_Auto_Emergency_Stop_For_Z_Endstop_Switch/AES.md)

If thats not enough how about creating your very own online auto updating backup of all your config files here on Github in your own private repo?!

- [Auto backup your printer!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/tree/main/Documentation/INSTALL_INSTRUCTIONS/Auto_Backup_Your_Printer/Git_Backup.md)
