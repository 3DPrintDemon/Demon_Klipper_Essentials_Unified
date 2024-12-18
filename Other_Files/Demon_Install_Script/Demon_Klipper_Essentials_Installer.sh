

#!/bin/bash

# 3DPrintDemon Klipper Essentials Installer Script v1.0.0

# Define
U="$USER"
DIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified"
PDIR="/home/$U/printer_data/config/Previous_Demon_Macros"

# Check if directory not exist
if [ ! -d "$DIR" ]; then
   echo "Repo $DIR does not exist."

else
    echo "Directory $DIR already exists."
  
        if [ ! -d "$PDIR" ]; then
            # Make Directory
            mkdir "$PDIR"
            echo "Directory $PDIR created."
             
        else
            echo "Directory $PDIR already exists."
        fi

    mv /home/$U/printer_data/config/Demon_Klipper_Essentials_Unified /home/$U/printer_data/config/Previous_Demon_Macros --backup=numbered
fi

cd /home/$U/printer_data/config
git clone https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified.git
echo "Repo $DIR cloned."

cd /home/$U
wget https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Vars/demon_vars.cfg -O demon_vars.cfg --backups=0
echo "Repo Demon_Vars installed."

echo "Operations complete."



