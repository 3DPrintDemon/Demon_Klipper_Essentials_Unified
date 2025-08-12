# SOVOL AUTO FEEDER INSTALL

<img width="743" height="848" alt="SOVOL AUTO FEEDER" src="https://github.com/user-attachments/assets/5ef916f6-1759-469a-b052-4666aab483ac" />

## You can install the Sovol Auto Feeder unit on any canbus printer for use with these macros!

You will need an active Canbus network, If you dont have one your mainboard might support CanBridge mode, if not it will need a U2C module to add a Canbus network to your machine!

## Install Direct Via SSH 

Start by changing directory to:

```
cd ~/klipper/klippy/extras
```

## This is the safe way where these commands will make your current files into a backup file ending in `.1` & then download the new files to use instead - RECOMMENDED!!

You need ALL of these files! They're designed for use with [Demon Klipper Essentials Unified](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified)

```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/filament_switch_sensor.py --backups=1
```
```
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/home/sovol/klipper/klippy/extras/buffer_stepper.py --backups=1
```
```
cd ~/printer_data/config
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/buffer_stepper.cfg  --backups=1
```

Then in your printer.cfg include the new file...

```
[include buffer_stepper.cfg]
```

>[!IMPORTANT]
>Disable your old filament sensor section in your printer.cfg or this system will not work!

<br>

## Add an unused pin as an override

Add an unused pin on your mainboard to control the manual override clog detection.

See line 40 of the `buffer_stepper.cfg` file, under the `[output_pin STOP_CLOG_DETECTION]`

<br>

Restart

```
sudo reboot now
```

>[!NOTE]
>By doing this it will give your Klipper install a "Dirty" status in update manager!

<br>

Connnections are:

GND | 24v

CANL | CANH

The Sovol cable uses non-standard Canbus colours, normally CanH is yellow & CanL is green

<img width="544" height="426" alt="Connection" src="https://github.com/user-attachments/assets/240b8478-51d7-46ac-9588-77b57d832ba3" />


