# HOW TO FIX & UPDATE STOCK SOVOL EMMC IMAGES

This process is tested & working on the latest SV08 MAX & SV ZERO printer firmware releases. It'll probably also work on the latest SV08 Eddy upgrade firmware also, however that is currently untested.


# BACKUP!

First & most IMPORTANTLY backup your entire config directory! 

>[!WARNING]
>Do not blame me if you bork this & you didn't make a good & complete backup of your setup! Continue at your own risk! 

<br>

# DISABLE BACKPORTS CHECK

SSH into the printer.

```
sudo nano /etc/apt/sources.list
```

comment out 

```
#deb http://deb.debian.org/debian bullseye-backports main contrib non-free
```

This is because this is no longer available so we need to skip checking for it.

Save & exit the file.

<br>

# UNISTALL OBICO

Uninstall this software that constantly pings an IP & spams your console constantly until you connect it!

```
sudo systemctl stop moonraker-obico.service
sudo systemctl disable moonraker-obico.service
sudo rm /etc/systemd/system/moonraker-obico.service
sudo systemctl daemon-reload
sudo systemctl reset-failed
rm -rf ~/moonraker-obico
```

Then remove the config files

```
rm ~/printer_data/config/moonraker-obico.cfg
rm ~/printer_data/config/moonraker-obico-update.cfg
```

Now in your `printer.cfg` comment out

```
# [include moonraker_obico_macros.cfg]
```

<br>

# RECTIFY & UPDATE

First we're going to update the system packages. To do this we need to update the list we need.

```
sudo apt-get update --fix-missing
```

Now to start the update process.

```
sudo apt-get upgrade
```

If the terminal returns a message saying some packages were not upgraded or were missing run the above commands again. This time it should do it, it might take a long time so be prepared to wait for it! Especially as it might look like its frozen but it's just thinking about stuff & will complete soon!

<br>

# How to fix Moonraker Warnings

```
cd ~/moonraker/scripts
./set-policykit-rules.sh
sudo service moonraker restart
```
```
cd ~/moonraker/scripts
./install-moonraker.sh
```
```
/home/sovol/moonraker-env/bin/python -m pip install --upgrade pip
```

Now restart

```
sudo reboot now
```

<br>

# USING UPDATE MANAGER TO UPDATE COMPONENTS

Open your `moonraker.config` file

you need to paste these sections in. 

>[!CAUTION]
>Make sure you do not duplicate anything there already that's commented in!

```
[update_manager]
channel: dev
refresh_interval: 168

[update_manager Demon_Klipper_Essentials_Unified]
type: git_repo
path: ~/printer_data/config/Demon_Klipper_Essentials_Unified
origin: https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified.git
primary_branch: main
is_system_service: False
managed_services: klipper

[update_manager mainsail-config]
type: git_repo
primary_branch: master
path: ~/mainsail-config
origin: https://github.com/mainsail-crew/mainsail-config.git
managed_services: klipper

[update_manager mainsail]
type: web
channel: stable
repo: mainsail-crew/mainsail
path: ~/mainsail

[update_manager KlipperScreen]
type: git_repo
path: ~/KlipperScreen
origin: https://github.com/jordanruthe/KlipperScreen.git
env: ~/.KlipperScreen-env/bin/python
requirements: scripts/KlipperScreen-requirements.txt
install_script: scripts/KlipperScreen-install.sh
managed_services: KlipperScreen

# Crowsnest update_manager entry
[update_manager crowsnest]
type: git_repo
path: ~/crowsnest
origin: https://github.com/mainsail-crew/crowsnest.git
managed_services: crowsnest
install_script: tools/pkglist.sh
```

Save & Restart

Now you should be able to go the Klipper's machine tab & under the new `Update Manager` section & be able to update all software apart from Klipper itself. With Crowsnest you will need to click the orange box on the right & selsct `Soft Recovery` & then it will be available for update afterwards. 

>[!CAUTION]
>Klipper itself needs to left as Sovol's own fork. Unless you intend to install mainline Klipper & go Eddy NG using the Sovol image, then you can remove & replace Klipper using Kiuah & contiune with your modifications.
>Otherwise DO NOT TOUCH IT!!!

>[!IMPORTANT]
>SV08 MAX users! If you replace Sovol Klipper with Mainline Klipper you will LOOSE FUNCTION of your Buffer_Stepper system! It is NOT useable with latest Klipper versions!!


You should now have a fully updated machine!


[Back to the main install instructions](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md)

[Back to the SV08 MAX install instructions](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_EXTRA_INSTRUCTIONS.md)


