# GENERAL INSTALL & SETUP FOR ALL PRINTERS

**PLEASE CHECK ALL INSTRUCTIONS CAREFULLY!**

>[!CAUTION]
>Don’t just install & run the macros & wonder why they don’t work! They WILL need setting up once on your system. Damage to your machine may result if the macros are run without the prerequisites or without the correct setup before first use!

You will need to edit your slicer's `Start G-code` & `End G-code` boxes to get the `DEMON_START` macro to work correctly.

<br>
<br>
<br>

# NEW! COMPANION INSTALL VIDEO!

Here's quick run-through of the general install process. This is NOT meant to replace the written instructions below, it's meant purely as a visual guide that will help you get the macros up & running on your system. By the time you're done you should be confident & comfortable working with the files on your printer to contiune with setting up the macros further. 

***...You got this!***

<a href="http://www.youtube.com/watch?feature=player_embedded&v=SvPROz0Q96M
" target="_blank"><img src="http://img.youtube.com/vi/SvPROz0Q96M/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="500" height="360" border="10" /></a>

- [Install Demon Klipper Essentials Unified in 15 Minutes or Less!](https://youtu.be/SvPROz0Q96M)

<br>
<br>
<br>

# IMPORTANT INFO BEFORE YOU START...

>[!IMPORTANT]
>Click the lines below to expand them to read the contents!

### File Structure Has Changed for v2.9.4 Onwards

<br>

<details>
    <summary>
        <b>
        Click to expand - File Structure Has Changed for v2.9.4 Onwards
        </b>
    </summary>
<p>
</p>
There is a new setup in the file structure of these macros. There is now a second directory that is now auto extracted to your config directory during install. This is done so to keep the main install's "clean" status intact in the Update Manager. This is what the functional system looks like. 

#### After the initial install of `Demon_Klipper_Essentials_Unified`.

The image below is what your config directory should look like after the initial install has completed. 

If the `Demon_User_Files` directory & contained files are not present then the system is not ready for use! This directory also needs to be included in to the system - explained later on.

![Demon_Config_DIR](https://github.com/user-attachments/assets/54e85efb-5d9d-4e3e-a90e-a58710cf15a3)


Check inside the `Demon_User_Files` directory you should see these 3 files, there could also be a system created archive directory if you had these files here before...

![Demon_User_Files](https://github.com/user-attachments/assets/bbd26215-be8c-4d45-9869-a7c23db06cb5)


If your directory is empty please click the reload button for your web browser to refresh the Mainsail page.

</details>

<br>

### TROUBLESHOOTING SECTION

>[!TIP]
>This is important so it's at the top where you might see it, as if not correct it'll cause the following issues...

<details>
    <summary>
        <b>
        Click to expand - What if you get a EOF error?
        </b>
    </summary>
<p>
</p>
The error below should now be rare if new SSH installer is used!

If this file is not present on your first reboot but you have already added the `[save_variables]` section you'll see this error:

![EOF Error](https://github.com/user-attachments/assets/2da883e7-9228-47ae-9637-976b54ce0db0)


Don't worry though this is just telling you the system created the file but it does not have the required saved variable within the file. After you have included the Demon macros in your printer.cfg file you can then home the printer to create the variable within the file to clear the error. Unless you're running `Klicky Probe` then please [see here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#unless-youre-using-klicky-probe) as simply homing the printer wont clear the error unless you have edited the Klicky macros first.

</details>

<details>
  <summary>
        <b>
        Click to expand - What if you get a popup boot loop welcome message?
        </b>
    </summary>
<p>
</p>
If you get a boot looping popup welcome message that wont go away check your system for any other [save_variables] sections or any other defined filenames!

If you feel your demon_vars.cfg file is not working you can reinstall it directly from your current version of the `Demon Klipper Essentials Unified` macros.

```
sudo service klipper stop
```
```
cp -f ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Vars/demon_vars.cfg ~/
```
```
sudo service klipper start
```

If that doesnt work try changing your filename line to:
```
[save_variables]
filename = ~/demon_vars.cfg
```

Also double check you have no other `[save_variables]` sections defined in your system. 

Then Save & Restart.

</details>

<details>
  <summary>
        <b>
        Click to expand - What if you get a popup boot loop extract files message?
        </b>
    </summary>
<p>
</p>

Due to the way the Kiauh Shell Script Extension works if you have a custom user account name you will need to do [this work-around](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#for-custom-user-account-names).

</details>

<details>
    <summary>
        <b>
        Click to expand - Manually reinstall your demon_vars.cfg file
        </b>
    </summary>
<p>
</p>

If you feel your demon_vars.cfg file is not working or is missing you can reinstall it directly from your current version of the `Demon Klipper Essentials Unified` macros. This will reset any values in your old file back to system defaults!

```
sudo service klipper stop
```
```
cp -f ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Vars/demon_vars.cfg ~/
```
```
sudo service klipper start
```
</details>

<br>

### UPDATING FROM A PREVIOUS VERSION - SSH CONFIG UPDATER SCRIPT!

>[!TIP]
>Thanks to this amazing community we have our first official contribution to Demon Klipper Essentials Unified! This contribution now allows you to update your demon_user_settings cfg file across versions via interactive SSH Python script where it'll give you choices to bring in or bypass previously set values from your old files!!

<br>

<details>
    <summary>
        <b>
        Click to expand - SCRIPT: USER SETTING FILE UPDATER!
        </b>
    </summary>
<p>
</p>
    
To use this new feature you'll need to install a couple of things first. SSH into your printer.
    
``` 
python3 -m pip install rich
```

Wait for this to complete then run.

```
python3 -m pip install ConfigUpdater
```

These commands will install the libaries you need to run the interactive user file updater script.

To use the feature use this command...

```
python3 ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_config_update.py
```

Other things you will need to look at when updating!
[UPDATING FROM A PREVIOUS VERSION CLICK HERE!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Other_Files/Version_Config_Changes/V2.9_Config_Changes.md)
</details>

<br>

![Updater](https://github.com/user-attachments/assets/2dac0a2d-6795-4a3c-b903-d4c35b8d9a39)

<br>

### FEATURE: DEMON DIAGNOSTICS!

>[!TIP]
> BE SURE TO USE THIS WHEN SETTING UP! It's your onboard helper tool!
>This sytem will help you see whats been done, what needs doing & what is not correctly set yet!

<br>

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

<br>

![DD-1](https://github.com/user-attachments/assets/24fcda75-5418-4b3f-95c1-73c2197f6e45)

>[!NOTE]
>This diagnostic tool is extremely strict & will not allow hashed out comments or white space (spaces) after any printer.cfg sections or include commands. Keep this in mind if you can't turn a section green!

<br>
<br>
<br>


## DEMON DISCORD!

Come & join the community! We've just launched Demon Discord, help us start building a fantastic user focused resource for help & support from other users, share custom expansion gcode, or simply chat & show off your machine & your latest prints!

<p align="left">
    <img width="500" alt="Demon_Discord" src="https://github.com/user-attachments/assets/980b8b69-f78b-43b1-be27-cc1236fcf794" />
    <https://discord.gg/KEbxw22AD4>
</p>

[https://discord.gg/KEbxw22AD4](https://discord.gg/KEbxw22AD4)

<br>
<br>
<br>


# Preparing Your Current System

### MAKE A BACKUP!

Make a backup of your current system now! Be sure you at least download your current `/config` folder BEFORE YOU DO ANYTHING ELSE!! You want have a set of UNTOUCHED files to refer back to if needed!

<br>

### Disable Your Current Macros

<details>
    <summary>
        <b>
        Click to expand - How To Disable You Current Macros
        </b>
    </summary>
<p>
</p>

Disable your current macros for START_PRINT & END_PRINT, plus any others you don't need including any for calibration & levelling.

The best way to do this is to comment out the old macro file include command in your `printer.cfg` by placing a hash in front of the command.
```
EXAMPLE
# [include ./Your_Old_Start_End_Macros_File.cfg]
```

If however you can't do this as the macros are in amongst other macros in the same file, or they're in your `printer.cfg` you can select every line of the macros you want to disable & press the following keyboard commands...

`Crtl+/` on windows PC

OR....

`Cmd+/` on MacOS

Now click `Save` & exit the file, no need to restart just yet, unless you want to.

</details>

<br>

### Not Sure How to SSH?

<details>
    <summary>
        <b>
        Click to expand - If you're not too sure on how to "SSH" or would simply like to check you're doing things correctly
        </b>
    </summary>
<p>
</p>
    
Be sure to use something like WinSCP or Putty on WindowsPC or Terminal on MacOS to log into your system via SSH, you'll need your printer's IP address along with its account name & password.

- Open a new SSH terminal & write in the below example but replacing the objects between the `< >` (NOT including the `<>` less/more than or xx symbols.) with your printer's information. 

```
EXAMPLE
ssh <pi>@<192.168.1.xx>

NOT including the <> less/more than symbols or the xx on the end.

<pi> = your printer's account name, so biqu, pi, mks, sovol for example

<192.168.1.xx> = your printer's full IP address replacing the example numbers with yours.

This can be found from your WiFI router in most cases.
```
```
So basically the command will be something that will look like....

EXAMPLE
ssh pi@192.168.1.95
```

- Once you have input the correct account name & IP address as above 

- Press return

- Then the terminal will ask you for your password. Enter it, it wont be displayed on screen but it will be working.

- Press return again to login.

You're now ready to begin issuing commands to install the macros.

</details>

<br>

### Install Kiauh G-code Shell Command Extension

<details>
    <summary>
        <b>
        Click to expand - OPTIONAL BUT RECOMMENDED - Kiauh G-code Shell Command Extension - OPTIONAL!
        </b>
    </summary>
<p>
</p>
    
While not vital to Demon Klipper Essentials it will provide additional functionality to the system & quality of life features, if you wish not to use it then don't install it & don't include the new `Extract_Demon_User_Files_x.cfg`, you'll just have to deal with some file management tasks manually. 

If you do install the shell command extension & want the system to help manage your `User Files` be aware that it gives Klipper access to system level shell commands that have a very small potential for misuse if you download macros or files from any dubious or malicious sources! Also don't mess with the Demon `.sh` files unless you know what you're doing as you can seriously break stuff if you get things wrong!
These macros only use the G-code Shell Commands to help to keep your `User Files` up to date & in a directory were you can edit & manage them without creating a "dirty" status on the main Demon Klipper Essentials install.

- https://github.com/dw-0/kiauh/tree/master

Once installed navigate to option 4 (Advanced), then option 8 (G-code Shell Command) to install the extension.

###### NOTE: If using the new V6 alpha release these options change to "E" for extensions, then option 1 for (G-code shell command), then option 1 to install. 
###### NOTE: BE aware the V6 release of Kiauh is alpha stage software! Be cautious using it, I would recommend using the last stable release instead for this task, just incase!

![Shell Install](https://github.com/user-attachments/assets/d4897e79-f019-4c67-8474-ed8ca28b3612)

###### NOTE: Please take extra care of your system & protect it from misuse after installing the Kiauh G-code Shell Command Extension! Responsibility for this is solely on you.

</details>

****************************************************************************************************************************

<br>
<br>
<br>


# MAIN SSH INSTALLER HERE:
### RUN THIS FIRST FROM YOUR SSH TERMINAL TO START YOUR FULL INSTALL!

Use for any machine Voron, SV08 to Ender!

>[!IMPORTANT]
>It is highly recommended to use this installer if you're installing fresh or updating from an older version and are not using Moonraker's Update Manager! It will archive your old files for you.

RUN THIS FIRST:
```
wget -O - https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Install_Script/Demon_Klipper_Essentials_Installer.sh | bash
```

<br>
<br>
<br>

# PREREQUISITE INSTALLERS HERE:

Next run ONE of these from your SSH terminal to install your prerequisites. These scripts will ask you your prerequisite install choices. 

<br>

### FOR ALL PRINTERS VORON to ENDER - EXCEPT SOVOL SV08 OG MACHINES!

```
sh ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_Prerequisites_Installer.sh
```

<br>

### SOVOL SV08 OG MACHINE SPECIFIC PREREQUISITES INSTALLER...

>[!NOTE]
>Do not use this unless you have a Sovol SV08 OG printer!! NOT SV08 MAX!

```
sh ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/Demon_Sovol_SV08_Prerequisites_Installer.sh
```

****************************************************************************************************************************

<br>
<br>
<br>


# ...Your new files should now be Installed! 

Your new files should now be avaiable to you on your printer! Please note you may need to reload your `Mainsail` browser page for new items to show correctly.

>[!NOTE]
>Don't forget to reload your web browser window so new items will show & work correctly after installation!

>[!IMPORTANT]
>DO NOT include the new files just yet as there's some important stuff to do first!

<br>

- [Other ways to install are here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/Other_Ways_To_Install.md)

****************************************************************************************************************************

<br>
<br>
<br>

# DEMON KLIPPER ESSENTIALS UNIFIED SETUP...

Lets start the setup of these macros, the first and most important step is to make sure a few things are correctly defined.

<br>

## Define Save Variables Section

Add this to your `printer.cfg` preferably BEFORE you include the macros. 

>[!IMPORTANT]
>Be sure to comment out any other [save_variables] already in your printer.cfg, if you don't the system can't update the demon_vars.cfg variable file.

```
[save_variables]
filename = ~/demon_vars.cfg
```

<details>
    <summary>
        <b>
        Click to expand - Manually reinstall your demon_vars.cfg file
        </b>
    </summary>
<p>
</p>

If you feel your demon_vars.cfg file is not working or is missing you can reinstall it directly from your current version of the `Demon Klipper Essentials Unified` macros. This will reset any values in your old file back to system defaults!

```
sudo service klipper stop
```
```
cp -f ~/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Vars/demon_vars.cfg ~/
```
```
sudo service klipper start
```
</details>

****************************************************************************************************************************

<br>

## Define Force Move Section

Be sure to define the force move section in your printer.cfg file or your printer wont be able to make use of the new homing routine. 
```
[force_move]
enable_force_move: True
```

****************************************************************************************************************************

<br>

## Idle Timeout printer.cfg 

To use the new timeout settings correctly you should set your `printer.cfg` `[idle_timeout]` section like this:
```
[idle_timeout]
gcode:
    _DEMON_IDLE_TIMEOUT
timeout: 3600
```

This will call the new Demon timeout macro after 1 hour & execute the functions of your choice in the demon_user_settings file

****************************************************************************************************************************

<br>

## Set Up Your Mainsail.cfg File!

You will need to configure your `Mainsail.cfg` `_CLIENT_VARIABLE` macro, set it up now! 

### [Click here to do that!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/Set_Up%20_Your_Mainsail.cfg.md)

If you choose *NOT* to use the Mainsail.cfg...

>[!TIP]
>These macros make use of the `respond` command & is already defined in the your `Mainsail.cfg` file so if you are not going to use it please make sure your printer.cfg has this defined for use in the system, you will need to add the section manually. 

```
[respond]
```

****************************************************************************************************************************

<br>
<br>
<br>

# INCLUDE NOW!

Time to include the main macro files & their prerequisites, as well as the Demon User File Updater system.

<br>

## MAIN DIRECTORY INCLUDES

Now is a good time to use the include commands to bring the files into your system as you have the very basic requirements for the macros to run. 

Copy the code block below & paste it at the top of your `printer.cfg` file & then click the `Save & Restart` button to restart Klipper!

>[!IMPORTANT]
>It is vitally important that you have the `demon_vars.cfg` file & `[save_variables]` section in-place before you include these files, If you used the new SSH installer it will have been placed for you. You can jump back to [here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#define-save-variables-section) to confirm you did the step for the `[save_variables]` section, there is even a SSH command to manually place the `demon_vars.cfg` file if you need it.

```
[include ./Demon_Klipper_Essentials_Unified/*.cfg]
[include ./Demon_User_Files/*.cfg]
```
Your full include list should look like this example from my Voron 2.4 - the additional files used for your printer may well be different to mine depending on your machine & setup


![Includes](https://github.com/user-attachments/assets/0555c56b-a2f8-4efd-b2e1-ebb58a0fd8e6)

<br>

## FEATURE: DEMON USER FILES UPDATER!

> [!IMPORTANT]
> If you run this system but include the wrong file or it contains the wrong user account name the system will still be able to run but have an error due to the user account name & NO FILES WILL BE WRITTEN!

<br>

<details>
    <summary>
        <b>
        Click to expand - FEATURE: DEMON USER FILES UPDATER!
        </b>
    </summary>
<p>
</p> 

This new feature is a quality of life system that's useful if you'd like the macros to help manage your new `Demon_User_Files` directory & for it to automatically notify you if the version number has changed on these files & give you the option to auto extract the new versions from your updated macros.

This new system uses the `Kiauh` `G-code Shell Command Extension` optional install. If your user files need updating it will prompt you to extract the required files from the main `Demon Klipper Essentials Unified` directory & place them in the new directory `Demon_User_Files` outside of the managed main directory, this is directly inside your printer's `config` directory. It will also move your current files to a `Previous_Versions` directory & place the new updated files in the `Demon_User_Files` directory ready for you to transpose your previous settings onto them. This system will even create numbered backups of the files it moves if the version numbers are the same as before so you will never lose your settings. 

To use this awesome new feature you have to have the `Kiauh` `G-code Shell Command Extension` installed on your system as mentioned in the [prerequisites section](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Prerequisites/Prerequisites.md#optional---kiauh-g-code-shell-command-extension---optional). Then you need to add *ONE* of these include commands to activate the feature depending on what Pi system you're using. There are 4 pre-made ones for the most popular systems.

<br>

### Manual User File Placement

If you choose to manage the system yourself manually & not to use the `Demon_User_Files_Updater` you will need to create a new directory inside your `config` directory called `Demon_User_Files`.

Then you'll need to navigate to `/Demon_Klipper_Essentials_Unified/Other_Files/DEMON_User_Files_SOURCE` & copy the three user settings .cfg files inside into your new `Demon_User_Files` directory that you just created outside of the main `Demon Klipper Essentials` directory. So the file structure looks like [this...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#the-file-structure-has-changed-for-v294-onwards)

</details>

<br>


![Prompt](https://github.com/user-attachments/assets/77ba2d6b-14fe-437f-a607-8241f94e0fc5)

<br>

## DEMON USER FILES UPDATER INCLUDES


> [!TIP]
> If you run this system but include the wrong file or it contains the wrong user account name the system will still be able to run but have an error due to the user account name & NO FILES WILL BE WRITTEN!
> 
> You will also get a extract files message everytime you restart Klipper!
> 
>If you have a custom, non-standard user account name you will need to go in & adjust the file paths in the actual file you choose for it to work.

<br>

### For Custom User Account Names
<details>
    <summary>
        <b>
        Click to expand - If You Have A Host SBC with Custom User Account Name
        </b>
    </summary>
<p>
</p>

If you have a custom host name for your SBC you will need to adjust the file paths in one of the `Extract_Demon_User_Files_xxxx.cfg` files. This is due to how the Kiauh Shell Script Extension works. It requires the full file path to be specified including the host's custom user account name! 

* To do this you will need to copy the entire contents of a [Extract_Demon_User_Files_xxxx.cfg](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/tree/main/Other_Files/Demon_User_Files_Updater) file of your choice.
* Create a new file in the Demon_User_Files directory.
* name it...
  
```
Extract_Demon_User_Files_Custom.cfg
```

* Paste in the contents of your clipboard to the new file.
* Use `ctrl+F` on Windows or `cmd+F` on MacOS
* Search for the standard user account name in the file you chose to copy, e.g. sovol/biqu/mks/pi
* Then replace that entire file path with...

```
/home/<YOUR USER ACCOUNT NAME HERE>/printer_data/config/Demon_User_Files/Demon_User_Files_Updater/
```

* Be sure to leave file to be called at the very end of the file path in tact or the command WONT WORK! So for example the top file path on line 2 will read....

```
EXAMPLE!
command: /usr/bin/bash /home/<YOUR USE ACCOUNT NAME HERE>/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Demon_User_Settings.sh
```

* Do the same for the rest of the file paths in the cfg file.
* Save & Restart

</details>

<br>

### For Standard User Account Names

If you have a Raspberry Pi based system:
```
[include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_Rpi.cfg]
```
If you have a Biqu based system:
```
[include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_Biqu.cfg]
```
If you have a Sovol based system:
```
[include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_Sovol.cfg]
```
If you have a MKS based system:
```
[include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_MKS.cfg]
```

Then once you restart your system you'll be greeted by new system prompts telling you if anyhting needs to be done to get your system ready for use, & the option to let the system handle it or if you'd like to do it manually. If you select the `EXTRACT` option the system will copy the default files ready for you to edit & setup to a new directory. It will also handle any old files already there if there are any, you wont loose them.


If you're using the `Demon User Files Updater` after the restart & if any file needs updating your system will present you with extract files prompt where you should select `EXTRACT` & after the automated restart you should reload your browser page to display the new `Demon_User_Files` directory that will contain your new editable settings files & `demon_custom_expansion` macro file.

These files are placed here outside of the main `Demon Klipper Essentials Unified` directory so that it will remain prestine for use with Mainsails `Update Manager` as described below. this means you wont loose your edits to the settings files when the system detects you have modified the managed files, or when you update the `Demon Klipper Essentials Unified` macros in the future. The local `Demon User Files Updater` will then see the updated files & offer to extract a new set of `Demon_User_Files` for you automatically while archiving your old ones for safekeeping & reference. New files will be at default values.

>[!NOTE]
>Don't home the printer yet unless you have the `force_move` section defined & know the default homing settings are suitable for your machine!

****************************************************************************************************************************

<br>
<br>
<br>

# Load & Unload Macros


>[!NOTE]
>Klipperscreen Macros copy/paste into file is no longer required. Any previous copies of these LOAD/UNLOAD macros must be removed from any additional macro.cfg files in favour of the new included LOAD/UNLOAD macros. If you do not do this then there will be issues with the loading & unloading of filament. 

All load & unload macros now check the printer's `max_extrude_only_velocity` setting, a value of 25 or below will pass the check. 

Be sure your `printer.cfg` file `[extruder]` section contains...

```
max_extrude_only_velocity: 22
```

>[!TIP]
>The Orbiter v2.x extruders tend to like around 15-18 max!

****************************************************************************************************************************

<br>

# Printer Lights (White LEDs)
Be sure to name any White LEDs that are in the `printer.cfg` file you wish the macros to control to:

```
[led Printer_Lights]
white_pin: ### #<<<<<<<< ADD YOUR OWN PIN
cycle_time: 0.0010
initial_WHITE: 1.0
```

>[!TIP]
>If you were using the `Heat_Soak.cfg` (not the others but that specific one!) please redownload the new version here...
>- https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/tag/Heat_Soak_Timers_V1.0

****************************************************************************************************************************

<br>

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

![LED Chain Settings](https://github.com/user-attachments/assets/0b5c7bda-73e0-4cda-ba0c-f4edf0c03c96)

****************************************************************************************************************************

<br>
<br>
<br>

# Demon Klipper Essentials Mainsail Updates

To be notifed of main macro pack updates & to be able to install them with a single click from your Mainsail web interface paste the block below into your `moonraker.conf` file, its a good idea to keep it under the `update_manager` section.

```
[update_manager Demon_Klipper_Essentials_Unified]
type: git_repo
path: ~/printer_data/config/Demon_Klipper_Essentials_Unified
origin: https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified.git
primary_branch: main
is_system_service: False
managed_services: klipper
```

Here's some info on the `update_manager` section if you need it. https://docs.mainsail.xyz/setup/updates/update-manager

Also please note that if you do not use the new installer to update but instead jusy rely on Update Manager to update from v2.9.3 or lower you must run this ssh script before you update via mainsail from your old version for the first time. It will make sure your demon_vars.cfg file is also updated & ready for the latest version! 

```
wget -O - https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Install_Script/Demon_Vars_Installer.sh | bash
```

****************************************************************************************************************************

<br>
<br>
<br>

# Setting up KLIPPER's Adaptive Mesh option. 

There is no longer any need for a separate KAMP install for meshing. The adaptive purge line & smart park are still needed.

For Klipper's Adaptive Mesh feature to work you must have:
- You must have a version of Klipper later than 1st Feb 2024
- Enabled your Slicer for `Label Objects`
- It's good to have `Exclude Objects` too...
- Added the `file_manager` section to your `moonraker.conf` file for `object processing`  
- Added the `Exclude Object` section to your `printer.cfg` file

>[!TIP]
>Find options under Orca main window Process/Global/Others

![ORCA Label](https://github.com/user-attachments/assets/a2e51dab-a695-4eff-b637-a0b039e3e219)


Add this to your `moonraker.conf` file:
```
[file_manager]
enable_object_processing: True
```

Add this to your `printer.cfg` file:
```
[exclude_object]
```

Save & restart!

****************************************************************************************************************************

<br>
<br>
<br>

# Setting up KAMP_LiTE Adaptive Purge & Smart Park

KAMP_LiTE is simply KAMP but without the adpative meshing macro, as it is not required now klipper has Adaptive Meshing included by default. However the Adpative Purge & Smart Park features are still very useful! Changes listed in the link.

You must have a version of Klipper later than 1st Feb 2024. You must have completed the steps described in the above section.

Also the fork KAMP_LiTE must be installed & included, how to do this is in the below link:

https://github.com/3DPrintDemon/KAMP_LiTE/releases/tag/v1.0


You must set your desired values in the KAMP_Settings.cfg

![KAMP_LiTE Settings](https://github.com/user-attachments/assets/11708975-5592-489c-b1f4-f299d99afb41)

Then you must activate the KAMP settings in the `demon_user_settings_v*.cfg` file.

![KAMP_LiTE Vars](https://github.com/user-attachments/assets/309e6f1a-a8a0-41d5-aa76-646a6efdade5)

To use correctly ensure your `extruder` section in your `printer.cfg` has the line below defined & that its set to 5 or higher, if not the KAMP purge will be skipped & it wont work!
```
max_extrude_cross_section: 5
```

>[!NOTE]
>If `variable_adaptive_meshing` is set to `True` then the system will override the values for `variable_use_kamp_adaptive_purge` & `variable_use_kamp_smart_park`. It will always use the adaptive purge & smart park features no matter what the >settings are. Even if they're set to false. User control is handed back once `variable_adaptive_meshing` is set to `False`

<br>

>[!TIP]
>**To use adaptive meshing all files MUST have been sliced with `Label Objects` active.** 
>
>IF NOT YOU WILL RECEIVE THE FOLLOWING ERRORS!!

If you use ORCA SLICER:

`Error evaluating 'gcode_macro PRINT_START:gcode': gcode.CommandError: This error is caused by the sliced file not having "Label Objects" enabled! Please disable Adaptive_Meshing in the demon_user_settings.cfg or re-slice the file with it enabled and restart the print!`

If you use another slicer:

`Internal error on command:"PRINT_START"`

`Internal error on command:"BED_MESH_CALIBRATE"`

****************************************************************************************************************************

<br>
<br>
<br>

# BE SURE TO SET YOUR MACRO VARIABLES & WATCH THESE VIDEOS!

- Configure the macros in one place! Set the variables for all the Demon Klipper Essentials macros in the `demon_user_settings` file
- Configure the cleaner/purge bucket variables in the `demon_user_settings_cleaner_variables` file
- There is no need to edit any macro code with this macro pack!
- NOTE: If you don't set `_CLEAN_VARIABLES` the printer will give you an error if you haven’t done this & try to use the nozzle clean macros.


![Settings](https://github.com/user-attachments/assets/6692d5f0-8947-4e76-b48c-efe245048b48)





**BE SURE TO WATCH THESE WHILE YOU SET UP YOUR MACROS...**

<a href="http://www.youtube.com/watch?feature=player_embedded&v=ZS17Bx_XUIY
" target="_blank"><img src="http://img.youtube.com/vi/ZS17Bx_XUIY/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="500" height="360" border="10" /></a>

- Long walkthrough video for Demon User Settings: https://youtu.be/ZS17Bx_XUIY

<a href="http://www.youtube.com/watch?feature=player_embedded&v=Nk6oSrvPmgw
" target="_blank"><img src="http://img.youtube.com/vi/Nk6oSrvPmgw/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="500" height="360" border="10" /></a>

- Walkthrough video on Demon User Settings Cleaner Variables: https://youtu.be/Nk6oSrvPmgw
- Will update this video soon for new version
  
****************************************************************************************************************************

<br>
<br>
<br>

# FEATURE: DEMON HOMING CONTROL!

This sort of thing has been available for some time elsewhere but this is the first time we have a version integrated here in the 3DPrintDemon macros. This feature will lower the motor current on the X & Y axis motors when homing the printer & then increase it again to normal levels afterwards! This means your printer will be a little more gentle when homing. 

This system will also not let you home the printer with the toolhead under 5mm high & it’ll always raise the Z axis by an amount of your choosing if the motors are disarmed BEFORE actually homing the printer in the Z & Y axes. Plus when the motors are armed & the printer is in a homed state after that initial raise it won’t raise the axis again when homing until they’re disarmed or homing is commanded at <5mm! 
So there’s no more risk of homing at Z0.2mm after a stoppage or a Z offset calibration test or risk hitting any clips or nozzle cleaners etc!
Not only that the homing macros know automatically if you’re using a BTT Eddy Probe or not and will adapt themselves to it!

****************************************************************************************************************************

<br>

>[!IMPORTANT]
>DEMON Homing Control - IMPORTANT!
To use the `demon_homing_control_vx.x.cfg` file
be sure to comment out or un-include & disable any old homing or sensorless homing macros you might have, you will also need to comment out any old `[safe_homing]` & `[homing_override]` sections in your `printer,cfg` or macro files.
>
>UNLESS you’re using `Klicky Probe`!
>
>For printers using `Klicky Probe` [you need to do this to get things to work correctly!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/Kicky_Probe_Users.md)

****************************************************************************************************************************

## Z Endstop Switch

If you’re using your printer with a separate endstop switch & you are NOT using the `Klicky` macros you need to set the location of your Z endstop switch in the Demon macros `demon_user_settings_v*.cfg file`. There’s two variables for you to define the location of your separate endstop switch.

Open the `demon_user_settings_v*.cfg` file & search 

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

If for any reason you wish to revert back to your normal homing system, simply comment all back in from your old system & disable the `demon_homing_control_v*.cfg` file by commenting out its full content apart from the file version number at the bottom. Make your selection & then by then `ctrl+/` on wondows or `cmd+/` on MacOS.

## DEMON HOMING CONTROL SETTINGS 
Found in the demon_user_settings_v2.9.cfg onwards.

[Settings list here...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/Demon_Homing_Control_Settings.md)


****************************************************************************************************************************

<br>
<br>
<br>

# NEW EDDY NG SUPPORT!! 

Eddy NG is now fully supported within the macros, adding the tap command to the custom_expansion file is no longer required & can be removed! 

Follow the Eddy NG wiki & install the firmware & klipper files, then be sure to add the Eddy NG printer.cfg sections to your actual printer.cfg file. Do not use in another included file or the g-code offset adjustment system in Eddy NG will not work & you'll get a conflicting value error!

Set your chosen values for Eddy NG in the demon_user_settings_vx.x.x.cfg file

If done correctly the macro's will automatically know you are using EDDY NG & will adapt all relevant macros to suit!

### RANDOM & CUSTOM TAP FEATURE!
Set if you wish EDDY NG to "TAP" in your original home location, or if you want it to "TAP" a custom spot away from the most used area of your bed. Maybe you'd simply prefer for it to "TAP" a random spot around your orignial home loaction, or possibly even a random spot around a custom location! The choice is yours!

Choose if you wish to disable the bed heater temporarily while tap is in progress to reduce any possible interference!

Don't forget to update your [.json file](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/tree/main/Other_Files/DEMON_Macro_layout_JSON) to add the new EDDY NG setup macro.

Note: Do not use Demon Eddy or BTT Eddy files with EDDY NG!

<br>
<br>
<br>

# DEMON EDDY!!!

USE THIS IF YOU HAVE A BTT EDDY DUO/USB PROBE & HAVE NOT INSTALLED EDDY NG!!

NOT for use with Sovol Eddy probes!

Demonise your Eddy! Download this file, set it up for you printer & run it!

If you're still on main branch Klipper & have NOT installed EDDY NG software you should be using DEMON EDDY & NOT the files BTT provide! Use this file below!

https://github.com/3DPrintDemon/Demon_Eddy/tree/master

Once Your probe is setup correctly & tested working all Demon Z_Probe calibration, machine meshing & machine levelling macros all now automatically detect & support BTT Eddy Probe! Just hit go & it’ll do its thing!

****************************************************************************************************************************
<details>
    <summary>
        <b>
        Click to expand - Old BTT file setup no Offset adjsutment - Don't use with DKEU!
        </b>
    </summary>
<p>
</p>
For use here with the Demon macros we need to be using the regular version (non-homing & non-offset)
https://github.com/bigtreetech/Eddy/blob/master/sample-bigtreetech-eddy.cfg

For a Printer with `Eddy Probe` being used as your Z endstop probe, basically homing the printer with the probe (No separate Z endstop Switch) you need to modify their file. 
Don’t worry it’s super simple! Open the file linked above & “comment in” lines 101-105.

 IMPORTANT>>>>>>> LEAVE  LINE 106 COMMENTED OUT!! 

I REPEAT LEAVE LINE 106 COMMENTED OUT!!! Comment in lines 101-05 ONLY!

![BTT_Eddy_setup](https://github.com/user-attachments/assets/dedc2189-7ed8-47c4-b03d-6f500cfabbd4)




##### NOTE: If you're using Eddy as a bed scanner only & have a separate endstop switch DO NOT do the above. Leave the file as it is.

Actual Probe setup & calibration. You will need to setup your Eddy Probe still, steps how to do this are here:
https://github.com/bigtreetech/Eddy/blob/master/README.md

</details> 

****************************************************************************************************************************

<br>
<br>
<br>

# FIRST HOMING TEST!

>[!IMPORTANT]
>Be sure you have included the files correctly & have set everything up as well as possible.

If you are sure you have covered all items general and model/setup specific you can attempt your first homing! Be sure to double check your probe &/or Z endstop is working correctly!

When you try to home the printer for the first time cover the EMERGENCY STOP button incase something goes wrong. Also pay attention to the console in Mainsail, it should output a sequence like this...


![Homing_Console](https://github.com/user-attachments/assets/207b57d1-7738-40ff-aa3b-980e737e7fdf)


If the console only shows `G28` for example there is an issue with your demon_homing_control file, please abort homing & check the system!

>[!CAUTION]
>Improper setup of the macros & the demon_homing_control feature can & will cause damage to your printer! It is down to you to make sure this system is operational before use!
No liability or responsibility will be accpeted for any damage caused by the use of these macros.

****************************************************************************************************************************

<br>
<br>
<br>

# Macro Layout Import/Restore

In Mainsail click the cogs top right of the screen & then click the `RESTORE` button in the `Interface Settings` window under the `General` tab. Now find the `backup-mainsail-DEMON-MACROS-v2.9.json` file, click open & then select the macros option, then click `Restore` to bring in the macro setup.

This will bring in the defualt macro layout.
- [CLICK HERE FOR MACRO LAYOUT FILE](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/tree/main/Other_Files/DEMON_Macro_layout_JSON)

It will not change your toolhead layout, you will need to do this yourself if you wish to. This is done by changing the `Style` option in the `Control` tab of the `Interface Settings` window to `Circle`.


![Macro_Layout](https://github.com/user-attachments/assets/2300774a-20ef-4024-8c4d-99a43ee3c2c5)

****************************************************************************************************************************

<br>
<br>
<br>

# Orca Slicer Setup

You have to modify your slicer's `Machine Gcode` that is sent to the printer.

### Orca Slicer Machine Gcode!
To modifiy the `Machine Gcode` in Orca Slicer [click here...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/Orca_Slicer_Setup.md)


### Other Slicers
- [Other Slicer's click here...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Other_Slicers_Start_G-code/Other_Slicers.md)


### Orca Slicer Additional

If you get the error in the photo below it means your version is not v2.2.0 (beta or beta2 or later)
PLEASE UPDATE YOUR SLICER! 

Do NOT use Orca Slicer from anywhere other than GitHub or Flathub. Orca Slicer Does NOT have a dedicated website associated with the project.

Use this link....

- https://github.com/SoftFever/OrcaSlicer/releases


![Orca Fail](https://github.com/user-attachments/assets/2b2c4cb5-912b-470e-86f0-b3526b03fd50)

****************************************************************************************************************************

<br>
<br>
<br>

# Recognised Slicer Filament Types

>[!IMPORTANT]
>These macros rely on you setting the correct filament type in your slicer! BE SURE YOU DO THIS!

Recognised slicer filament types at the moment are:
- PLA
- PLA+
- ASA
- ABS
- PET
- PETG
- FLEX
- TPU

<br>


**Fin...**

<br>
<br>
<br>
<br>
<br>

****************************************************************************************************************************

# MODEL SPECIFIC INSTRUCTIONS

For model specific configuration click below. You need to do all the general setup for all printers as well as these extra steps...!!

## If you're using a Sovol SV08 OG printer 

- [Further configuration steps are here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Sovol_SV08_Setup/SV08_EXTRA_INSTRUCTIONS.md)

## If you're using a Sovol SV08 MAX printer   

- [Further configuration steps are here](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_EXTRA_INSTRUCTIONS.md)

****************************************************************************************************************************

<br>
<br>
<br>
<br>
<br>

# Additional Configuration - EXTRA STEPS
<br> 

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
      _FIL_CHANGE_PARK
    {% endif %}

[delayed_gcode encoder_sensor]
initial_duration: 1
gcode:
    SET_FILAMENT_SENSOR SENSOR=encoder_sensor ENABLE=0
```

****************************************************************************************************************************

<br>

## Modifying KlipperScreen Menus For New Features

Setup Klipperscreen PREPARE Menu

Open your `KlipperScreen.conf` file in your printer’s /config folder. If you don’t have one create one.
Paste the lines below in to create the new KS menu!


Add this to the top of the file, it defines the file section by naming your printer. You can also add your chamber temp or any other sensor or heater on your printer to the menubar in KlipperScreen. 

Example:
```
[printer <YOUR PRINTER NAME>]
titlebar_items: chamber
```

Then paste this below the above information to add the new custom menu. 

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

****************************************************************************************************************************

<br>

## Chamber Monitoring & Fan Control

To get the most from these macros you’ll need to add a Chamber thermistor to your machine if you haven’t already & a Chamber exhaust fan. 
- If you have a Chamber exhaust fan call it `[temperature_fan chamber]`
- If you instead have a Chamber Thermistor only & no Exhaust fan call it `[temperature_sensor Chamber_Temp]`

For use with a chamber fan...

```
[temperature_fan chamber]
pin: Chamber Temp Fan Pin # <<<<<<<< ADD YOUR OWN PIN HERE
max_power: 1.0
shutdown_speed: 0.0
kick_start_time: 0.5
cycle_time:0.01
off_below:0.1
sensor_type: Chamber Temp Fan Sensor Type # <<<<<<<< ADD YOUR OWN PIN HERE
sensor_pin: Chamber Temp Fan Sensor Pin # <<<<<<<< ADD YOUR OWN PIN HERE
min_temp: 5
max_temp: 70
target_temp: 50
control: pid
pid_kp: 35.5
pid_ki: 1.5
pid_kd: 40
max_speed: 1.0
min_speed: 0.0
gcode_id: C
```

<details>
    <summary>
        <b>
        Click to expand - OR the old verion is here...
        </b>
    </summary>
<p>
</p>
    
```
[temperature_fan chamber]
pin: ### < ADD YOUR OWN PIN HERE
max_power: 1.0
shutdown_speed: 0.0
kick_start_time: 0.5
cycle_time:0.01
off_below:0.1
sensor_type: ### < ADD YOUR OWN SENSOR TYPE HERE
sensor_pin: ### < ADD YOUR OWN PIN HERE
min_temp: 5
max_temp: 70
target_temp: 50
control: watermark
gcode_id: C
```

</details>

For use with a chamber sensor...
```
[temperature_sensor Chamber_Temp]
sensor_type: ### < ADD YOUR OWN SENSOR TYPE HERE
sensor_pin: ### < ADD YOUR OWN PIN HERE
min_temp: 5
max_temp: 60
gcode_id: CH
```

>[!NOTE]
>You can't use both a chamber fan & and a chamber sensor in the macros at the same time. It's set up for one or the other.
>It is possible to have both at once on your printer as long as you only set one to be used by the macros.

****************************************************************************************************************************

## Bed Fans setup

To use the macro's bed fan system set your bad fans up like this...

```
[fan_generic Bed_Fans]
pin: ### < ADD YOUR OWN PIN HERE
max_power: 1.0
shutdown_speed: 0
kick_start_time: 0.5
off_below: 0.20

[output_pin DISABLE_BED_FANS]
pin: ### < ADD YOUR OWN PIN HERE
```
****************************************************************************************************************************

## Chamber heater Setup

There are STL's for Voron machines available with instructions on how to build a chamber heater. 

>[!CAUTION]
>If you are unsure in any way how to build a unit such as this DO NOT BUILD ONE!
>
>WARNING ACTIVE CHAMBER HEATERS CAN BE DANGEROUS!!
>
>No liability or responsibility will be accepted in whole or in part for any losses, damages, injury or death linked directly or indirectly to the use of any STL models, digital data files, .cfg files, advice, information or settings supplied here or anywhere else, linked or not!
>
>USE AT YOUR OWN RISK!

If you're sure & you know what you're doing...

For a Neopixel equipped heater core [click here](https://www.printables.com/model/1054038-tartarus-heater-core-module-ptc-chamber-heater-enc)

![TARTARUS Heater Core](https://github.com/user-attachments/assets/e314525c-66da-48af-8ad5-43f8022d7470)

For a canbus heater & power control module [click here](https://www.printables.com/model/1054035-tartarus-canbus-ssr-module-for-chamber-heater-encl)

![TARTARUS Canbus Module](https://github.com/user-attachments/assets/d2052c1c-f50c-45a4-a1bf-a727e710c2f9)

To use the macro's chamber heater system set your heater up like this...

```
[heater_generic Chamber_Heater]
gcode_id: CH
heater_pin: ### < ADD YOUR OWN PIN HERE
max_power: 0.50
sensor_type: < ADD YOUR OWN SENSOR TYPE HERE
sensor_pin: ### < ADD YOUR OWN PIN HERE
control: pid
pid_Kp: 15.391
pid_Ki: 1.629
pid_Kd: 36.362
min_temp: 5
max_temp: 110

[heater_fan Chamber_Heater_Fan]
pin: ### < ADD YOUR OWN PIN HERE
max_power: 1.0
shutdown_speed: 1
off_below: 0.2
heater: Chamber_Heater
heater_temp: 55
fan_speed: 1.0

[verify_heater Chamber_Heater]
max_error: 120
check_gain_time: 90
hysteresis: 5
heating_gain: 2

[output_pin DISABLE_CHAMBER_HEATER]
pin: ### < ADD YOUR OWN PIN HERE - any unused pin will do, you don't have to have anything actually hooked up to it.
```

>[!CAUTION]
>Use this system with extreme care! Active chamber heaters can be dangerous!! Be sure to set it up safely as possible & to PID tune your heater!
>
>No liability or responsibility will be accepted in whole or in part for any losses, damages, injury or death linked directly or indirectly to the use of any STL models, digital data files, .cfg files, advice, information or settings supplied here or anywhere else, linked or not!
>
>USE AT YOUR OWN RISK!

****************************************************************************************************************************

<br>

## Voron 2.4 Auto Emergency Stop!

If you have a Voron 2.4 printer & are using a traditional Z endstop switch and if your nozzle ever doesn't make a clean contact with the switch or if the nozzle ever misses it totally due to either a homing error or obstruction this can seriously damage your printer! Costing you at minimum a build plate as your offset will be set incorrectly with a unclean press of the switch, or at worse further damage can be caused to the toolhead & bearing carriages! Install this simple mod, it could save you so much time & money!

<img width="600" alt="AES" src="https://github.com/user-attachments/assets/20abaa35-e019-4546-89f4-4da2df367bee" />

### MORE DETAILS HERE!

https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Voron_2.4_AES_System_Auto_Emergency_Stop_For_Z_Endstop_Switch/AES.md


****************************************************************************************************************************

<br>

## Auto Github Config Dir Backup!

Setup backups that are saved to your own private Github Repo with a single click as well as automatically on the hour every hour!
The backups can even be edited online than pulled down by the printer once online again so syncing everything up!

https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Auto_Backup_Your_Printer/Git_Backup.md

****************************************************************************************************************************

<br>

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

>[!NOTE]
>these commands are for a real Rpi, cloned system or systems built on different images will probably vary.

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

<br>

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

