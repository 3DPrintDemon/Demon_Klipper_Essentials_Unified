#!/bin/bash

cd ~/printer_data/config
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/plr.cfg --backups=1

cd ~
wget https://raw.githubusercontent.com/3DPrintDemon/SV08/refs/heads/main/Replacement_Files/plr.sh --backups=1
