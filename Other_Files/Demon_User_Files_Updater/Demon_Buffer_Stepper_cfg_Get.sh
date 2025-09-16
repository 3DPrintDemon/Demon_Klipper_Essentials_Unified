#!/bin/bash

cd ~/printer_data/config
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/buffer_stepper.cfg  --backups=1

cd ~/klipper/klippy/extras
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/filament_switch_sensor.py --backups=1
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/buffer_stepper.py --backups=1
