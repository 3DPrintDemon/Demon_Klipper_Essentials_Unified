************************************

![DEMON](https://github.com/user-attachments/assets/e3f166b4-200b-400f-a5d0-64d879cf33d5)

 
# Welcome to 3DPrintDemon DEVILISHLY GOOD Klipper macros! 

<br>

# Introduction 

These macros are smart & have adaptive properties, they will shape themselves to your printer what you’re printing without any need to edit any code! 
For example the macros know if your printer is CoreXY or bed slinger, they know if it's already homed so wont home it again, & can not only automatically shape itself to simple things like your printer’s bed size & what temperatures you’re printing at they can automatically choose & load the correct mesh for the filament type or temperature of your print, as your bed will slightly change shape the hotter it gets. They can do all that plus much, much more!

## These macros will run on almost any COREXY or BED SLINGER (cartesian) Klipper printer with no changes needed to the macro files! 
Small user setting changes will be required of course.

These macros have been developed for use on almost anything from a Voron printer to an Ender 3, & anything else in between! They will check what sort of machine you have & try to adapt themselves to it automatically!

So for example if you hit `MACHINE_LEVEL` on a COREXY printer you'll get a `QUAD_GANTRY_LEVEL`, but if you do the same on a bed slinger you'll get a `Z_TILT_ADJUST`. Plus the macros can even see if you have a COREXY machine that uses `Z_TILT_ADJSUT` & will make use of that system instead of QGL!

Checks & Error Handling with clear & easy to understand messages to tell you what's wrong!

<br>

## Slicer G-code has changed please [check & update here!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/Orca_Slicer_Setup.md)

This update now uses custom names & also provides a means of checking that you sent a file with the correct START Gcode for these macros! The system will halt the print & warn you if not! So no more sending a file to print with the wrong START Gcode & bad things happening!!

<br>

## SUPPORT FOR SOVOL'S PLR SYSTEM ADDED!!

If you have a Klipper error or power outage on your Sovol printer running stock firmware don't worry! The DKEU macros now can make use of the Sovol PLR feature!

<br>

## NOW WITH FULL EDDY NG SUPPORT!!!

A lot of time, love, coffee & lack of sleep testing has been poured into these macros! They have all been written 100% by a human! Fully ai code Free! No ai has been used to create them! 

**Made to make your printing life easier & your printer SMARTER!**

<br>

>[!IMPORTANT]
>These macros rely on you setting the correct filament type in your slicer! BE SURE YOU DO THIS!

<br>


A macro pack features list is here....

- #### [FEATURES LIST](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Features/Features.md)

****************************************************************************************************************************

<br>

 # START HERE....!!!

Click the link below to begin reading how to install!

- ## [GENERAL INSTALL & SETUP FOR ALL PRINTERS](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)

###### DO NOT SKIP THE PREREQUISITES INSTALLER AFTER RUNNING THE MAIN INSTALLER!


<br>

Files listed here are installed by the prerequisites installer apart from the Kiauh Shell Script Extension which is an optional but recommended manual install. Links in the following page are provided for your infomation & include any required setup or additional information you will need! They will also help you choose which file version to install when using the prerequisites installer!

- ###### [PREREQUISITES - Information Page](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Prerequisites/Prerequisites.md)

Changes list if you ran previous older versions. 

- ###### [UPDATE CHANGES FROM PREVIOUS VERSIONS CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)

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

### NEW FEATURE: PELLET FORMING PURGE - POOP_N_SHOOT!

![P_N_S](https://github.com/user-attachments/assets/dc9cafb2-aaea-4c4e-b18e-8c8c51f850dc)

There's a whole new way to purge filament on any printer! Use a dedicated purge area or the edge of your print bed to create a poop pellet & use the nozzle/toolhead to shoot it into the bucket! Fully customisable features!

Activate with the demon_user_settings_cleaner_variables .cfg file!

<br>

<details>
    <summary>
        <b>
        Click to expand - FEATURE: PELLET FORMING PURGE SYSTEM!
        </b>
    </summary>
<p>
</p>
Choose many diiferent options, adjust & tune settings, including...

Positions - place the pellet where you want!

Parking - park the toolhead where you like!

Height - choose your height!

Speed - choose how fast or slow!

Temps - select what temps you want!

Feed lengths - choose load/unload & purge lengths!

Poop flow rate - tune the flow of poop!

Shoot direction - shoot your poop any way you like!

Program extras - pauses, extra cleans, turn fans on sooner!

Random Spot - never shoot from the same spot twice! Vary pellet placement within a chosen range!

Plus the printer knows if you have loaded or unloaded the filament even if you restart! It will know if you need a full load or unload or a simple purge & clean!!

Watch the [demo video!](https://www.youtube.com/watch?v=8Ou42thloCI)!

<a href="http://www.youtube.com/watch?feature=player_embedded&v=8Ou42thloCI
" target="_blank"><img src="http://img.youtube.com/vi/8Ou42thloCI/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="500" height="360" border="10" /></a>

</details>

<br>

>[!CAUTION]
>THIS SYSTEM REQUIRES ACCURATE SETUP & TUNING, IT WILL NOT WORK CORRECTLY OR RELIABLY IF YOU DO NOT TUNE IT WELL! PLEASE SPEND TIME DOING SO IF YOU USE IT!

****************************************************************************************************************************

<br>

### INSTALL THE SOVOL AUTO FILAMENT FEEDER ON ALMOST ANY KLIPPER PRINTER!

<img width="400" alt="SOVOL AUTO FEEDER" src="https://github.com/user-attachments/assets/7c3f532e-55a0-4c6f-9f95-96d337471b52" />

If you have a longer way to run your filament to your extruder, or if you run large/heavy (3-5kg) filament rolls this unit can help improve filament feeding & help reduce strain on your extruder motor! With these macros it'll automatically feed in & feed out your filament for the entire run to your extruder! Learn more [CLICK HERE!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/SOVOL_AUTO_FEEDER.md)

For use with these macros!

****************************************************************************************************************************

<br>

# Orca Slicer Heads-up!
If you get the error in the photo below it means your version is not v2.2.0 (beta or beta2 or later)
PLEASE UPDATE YOUR SLICER! 

Do NOT use Orca Slicer from anywhere other than GitHub or Flathub. Orca Slicer Does NOT have a dedicated website associated with the project.

Use this link....

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
