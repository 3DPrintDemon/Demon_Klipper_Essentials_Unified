

#!/bin/bash

# 3DPrintDemon Demon User Theme Enable Script v1.0.1

# Define
U="$USER"
UDIR="/home/$U/printer_data/config/Demon_User_Files/Demon_User_Theme"
TDIR="/home/$U/printer_data/config/.theme"
PDIR="/home/$U/printer_data/config/Previous_Themes"
SDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Themes/Demon_User_Theme_File"

# Check if directory not exist
if [ ! -d "$UDIR" ]; then
    echo "$UDIR does not exist."

    # Make Directory
    mkdir "$UDIR"
    echo "Directory $UDIR created."

else
    echo "Directory $UDIR already exists."
fi

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
# cp  $SDIR/DTI.txt $TDIR  
echo "Demon User Theme enabled!"

echo "Operations complete."
