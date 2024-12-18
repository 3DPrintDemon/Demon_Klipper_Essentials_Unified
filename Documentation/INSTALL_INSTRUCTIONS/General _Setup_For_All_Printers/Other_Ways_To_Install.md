If you feel these macros are valuable enough to download & use please consider hitting that "sponsor this project" button or the Ko-Fi image below or at https://ko-fi.com/3dprintdemon & buying me a beer/coffee. Its always very much appreciated & anything you do send goes towards helping me continue putting my ideas out there for the whole 3D printing community. Sending even a little makes a difference! Thank you & happy printing!!

[<img width="171" alt="kofi_s_tag_dark" src="https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/08473899-563b-4b4d-9409-5e6602d6ec44">](https://ko-fi.com/3dprintdemon)


# Option 1. INSTALL THE MACROS VIA NEW SSH INSTALLER!

Use the new Demon SSH Installer as your install method...
### [Back To Recommended Installer Section...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General%20_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#install-the-macros-via-the-new-ssh-installer)

****************************************************************************************************************************

# Option 2. OLD Manual SSH install.

```
cd ~/printer_data/config
```

```
git clone https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified.git
```
With this method you will need to install the `Demon_Vars.cfg` file manually to your User directory `~/`

Download this file even if you already have the old version. It is required present from first boot of the new update. Do this with this command...
```
cd ~
wget https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Vars/demon_vars.cfg -O demon_vars.cfg --backups=0
```

Then, paste the include command into your printer.cfg file
```
[include ./Demon_Klipper_Essentials_Unified/*.cfg]
```

This will bring these files into your system.

****************************************************************************************************************************

# Option 3. Install The Macros Manually

Scroll to the top of this Github page & click the green `Code` button. Then press `Download Zip` option at the bottom of the pop-up menu.

Copy the downloaded files into a directory called `Demon_Klipper_Essentials_Unified` in your config directory on your printer. 

###### NOTE: If you download the zip file via the button at the top of the repo your downloaded directory will be called:
```
Demon_Klipper_Essentials_Unified-main
```
You must delete the `-main` part of the name so it reads `Demon_Klipper_Essentials_Unified` ONLY. 

Then copy that renamed directory to your printer.

Then, paste into your printer.cfg
```
[include ./Demon_Klipper_Essentials_Unified/*.cfg]
```

This will include all .cfg files in a directory called Demon_KLIPPER_Essentials_Unified in your `/config` directory.

With this method you will need to install the `Demon_Vars.cfg` file manually to your User folder `~/`. Download this file even if you already have the old version. It is required present from first boot of the new update. Locate the Demon_Vars.cfg file in `Other_Files/Demon_Vars`

now use an SFTP client or SSH terminal & copy the file to your main account directory `~/`


### [Back To Where You Were...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General%20_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#install-the-macros-via-the-new-ssh-installer)
