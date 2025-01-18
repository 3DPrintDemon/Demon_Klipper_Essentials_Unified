

#!/bin/bash

# 3DPrintDemon Klipper Essentials SV08 Installer Script v1.1.1

# Define
U="$USER"
DIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified"
PDIR="/home/$U/printer_data/config/Previous_Demon_Macros"
DUF="/home/$U/printer_data/config/Demon_User_Files"
PDUF="/home/$U/printer_data/config/Demon_User_Files/Previous_Versions"
# Check if directory not exist

echo "
************************************************************************************************
                   Weclome to the 3DPrintDemon Klipper Essentials Unified 
                                SV08 Installer Script v1.1.1
************************************************************************************************

Starting installer..."

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
echo "demon_vars.cfg file installed."



echo "Creating Demon User files from local cloned directory, backups will be created if required."

# Check directory not exist
if [ ! -d "$DUF" ]; then
     # Make Directory
     mkdir "$DUF"
     echo "Directory $DUF created."
     
else
    echo "Directory $DUF already exists." 
     
    if [ "$(ls -A $DIR)" ]; then
         echo "Directory $DUF is not empty."
         
        if [ ! -d "$PDUF" ]; then
            # Make Directory
            mkdir "$PDUF"
            echo "Directory $PDUF created."

        else
            echo "Directory $PDUF already exists."
        fi
        echo "Archiving current Demon_User_Files to $PDUF."
        cp /home/$U/printer_data/config/Demon_User_Files/*.cfg /home/$U/printer_data/config/Demon_User_Files/Previous_Versions --backup=numbered
        rm /home/$U/printer_data/config/Demon_User_Files/*.cfg
         
    else
        echo "Directory $DUF is empty."
    fi        
fi

echo "Extracting Demon_User_Files to $DUF."
cp /home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/DEMON_User_Files_SOURCE/*.cfg /home/$U/printer_data/config/Demon_User_Files --backup=numbered

echo "Operations complete. Don't forget to run the Prerequisites installer...!"










