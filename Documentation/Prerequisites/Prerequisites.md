# Prerequisites

### Orca Slicer

Make sure you have the latest 2.2.0 (beta2 or later) version of Orca Slicer DO NOT USE ORCA SLICER DOT NET!!! BAD!!!

This link GOOD!

- https://github.com/SoftFever/OrcaSlicer/releases

******************************

# NEW!!! General Prerequisites Installer Here...

Install all the prerequisites in one easy script meant for all printers Vorons to Enders! If you have a Sovol SV08 use the other one below specifically for your machine!
```
wget -O - https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Install_Script/Demon_Prerequisites_Installer.sh | bash
```

## Sovol SV08 machine specific prerequisites installer here...
```
wget -O - https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Install_Script/Demon_Sovol_SV08_Prerequisites_Installer.sh | bash
```
###### NOTE: Do not use this unless you have a Sovol SV08 printer!! Seriously its not for you, move along, nothing to see here! ;-p
******************************

# ALL PRINTERS...

### OPTIONAL - Kiauh G-code Shell Command Extension - OPTIONAL!
While not vital to Demon Klipper Essentials it will provide additional functionality to the system & quality of life features, if you wish not to use it then don't install it & don't include the new `Extract_Demon_User_Files_x.cfg`, you'll just have to deal with some file management tasks manually. 

If you do install the shell command extension & want the system to help manage your `User Files` be aware that it gives Klipper access to system level shell commands that have a very small potential for misuse if you download macros or files from any dubious or malicious sources! Also don't mess with the Demon `.sh` files unless you know what you're doing as you can seriously break stuff if you get things wrong!
These macros only use the G-code Shell Commands to help to keep your `User Files` up to date & in a directory were you can edit & manage them without creating a "dirty" status on the main Demon Klipper Essentials install.

- https://github.com/dw-0/kiauh/tree/master

Once installed navigate to option 4 (Advanced), then option 8 (G-code Shell Command) to install the extension.

###### NOTE: If using the new V6 alpha release these options change to "E" for extensions, then option 1 for (G-code shell command), then option 1 to install. 
###### NOTE: BE aware the V6 release of Kiauh is alpha stage software! Be cautious using it, I would recommend using the last stable release instead for this task, just incase!

![Shell Install](https://github.com/user-attachments/assets/d4897e79-f019-4c67-8474-ed8ca28b3612)

###### NOTE: Please take extra care of your system & protect it from misuse after installing the Kiauh G-code Shell Command Extension! Responsibility for this is solely on you.

******************************
You must download & `[include]` these additional files along with these Demon Macros or they will NOT work correctly.

These additional macros are prerequisites:

## **FOR ALL MACHINES FOR ADAPTIVE PURGING & SMART PARK install KAMP_LiTE fork.**
- https://github.com/3DPrintDemon/KAMP_LiTE/releases/tag/v1.0

![AdptPurge](https://github.com/user-attachments/assets/d5f3cadd-08bc-4b60-b769-df9b5a433911)

******************************

### **For VORON PRINTERS or other machines with toolhead Neopixels**
- https://github.com/VoronDesign/Voron-Stealthburner/blob/main/Firmware/stealthburner_leds.cfg
- https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/tag/Heat_Soak_Timers_V1.0

![SBLED](https://github.com/user-attachments/assets/e61dc581-7e97-4388-9bfe-c14e7df68d09)

###### Note: You will need to choose the "sb_leds" or "toolhead_leds" file versions. 

###### Note: This file is requred for the heat soaks to work correctly. Install even if you dont have any LEDs & set a dummy pin.

******************************

### **For SOVOL SV08 PRINTERS**

![DEMON_Display_Menu](https://github.com/user-attachments/assets/36acc84f-8dbd-4d39-84b8-e2da8037f10e)

- https://github.com/3DPrintDemon/SV08/releases/tag/v1.0
- https://github.com/3DPrintDemon/Voron-Stealthburner/blob/main/Firmware/RGB_LEDs.cfg
- https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/tag/Heat_Soak_Timers_V1.0
  
###### Note: This file is required for the heat soaks to work correctly. Install even if you dont have any LEDs & set a dummy pin.

******************************

### Optional install for Armbian systems

![DEMON_Armbian_Boot](https://github.com/user-attachments/assets/cdd314a4-7369-479c-ba91-ca759f109b5c)

- [DEMON Armbian HDMI Boot Screen](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/DEMON_Armbian_HDMI_Boot_Screen/DEMON_HDMI_Boot_Screen_Install.md)

******************************

### **For other machines without toolhead Neopixels**
- https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/tag/Heat_Soak_Timers_V1.0
  
###### Note: This file is requred for the heat soaks to work correctly. Install even if you dont have any LEDs & set a dummy pin.

You must keep neopixels set to `False` in the `demon_user_settings_v2.9.cfg` `Hardware Options` section

******************************

- [Head on to General Setup For All Printers](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)

