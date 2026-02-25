

#!/bin/bash

# 3DPrintDemon Demon User Theme Installer Script v1.0.0

# Define
U="$USER"
UDIR="/home/$U/printer_data/config/Demon_User_Files/Demon_User_Theme"
TDIR="/home/$U/printer_data/config/.theme"
PDIR="/home/$U/printer_data/config/Previous_Themes"
SDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Themes/Demon_User_Theme_File"
IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Themes/Demon_Themes_Installers"

# Check if directory not exist
if [ ! -d "$UDIR" ]; then
    echo "$UDIR does not exist."
    echo "Requesting Klipper to set saved variables user_theme_enabled and user_theme_installed to False..."
    echo "SAVE_VARIABLE VARIABLE=user_theme_enabled VALUE=False" >~/printer_data/comms/klippy.serial
    echo "SAVE_VARIABLE VARIABLE=user_theme_installed VALUE=False" >~/printer_data/comms/klippy.serial
    wait
    bash $IDIR/Themes_Uninstaller.sh
    wait
    echo "Operations cancelled, please enable Demon User Themes first!"
    echo "Requesting Klipper call DEMON_THEME_LOADER macro..."
    echo "DEMON_THEME_LOADER" >~/printer_data/comms/klippy.serial
    wait
    exit

elif [ "$(ls -A $UDIR)" ]; then
    # Check if directory not exist
    if [ ! -d "$TDIR" ]; then
        echo "$TDIR does not exist."

        # Make Directory
        mkdir "$TDIR"
        echo "Directory $TDIR created."

    else
        echo "Directory $TDIR already exists."

        if [ "$(ls -A $TDIR)" ]; then
            echo "Directory $TDIR is not empty."

            if [ ! -f "$TDIR/DTI.txt" ]; then
                echo "A non-DEMON theme was detected! Moving files for you!"
                if [ ! -d "$PDIR" ]; then
                    # Make Directory
                    mkdir "$PDIR"
                    echo "Directory $PDIR created."

                else
                    echo "Directory $PDIR already exists."
                
                fi

                echo "Moving old theme files to $PDIR"   
                mv $TDIR/* $PDIR --backup=numbered

            else
                echo "A DEMON theme was detected! Replacing files!"
                rm $TDIR/*
                
            fi
        fi
    fi

    wait
    cp  $SDIR/DTI.txt $TDIR  
    cp  $UDIR/* $TDIR
    wait
    echo "Requesting Klipper to set SAVE_VARIABLE VARIABLE=user_theme_installed VALUE=True"
    echo "SAVE_VARIABLE VARIABLE=user_theme_installed VALUE=True" >~/printer_data/comms/klippy.serial
    wait
    echo "Demon User Theme installed!"
    echo "Requesting Klipper call DEMON_THEME_LOADER macro..."
    echo "DEMON_THEME_LOADER" >~/printer_data/comms/klippy.serial

    echo "Operations complete."
    
    

else
    echo "Requesting Klipper to set SAVE_VARIABLE VARIABLE=user_theme_installed VALUE=False"
    echo "SAVE_VARIABLE VARIABLE=user_theme_installed VALUE=False" >~/printer_data/comms/klippy.serial
    echo "Requesting Klipper to RESPOND TYPE=command MSG=action:prompt_end"
    echo "RESPOND TYPE=command MSG=action:prompt_end" >~/printer_data/comms/klippy.serial
    
    echo "Directory $UDIR is empty! Please copy your User Theme into directory $UDIR then try again!"
    exit
fi
