

#!/bin/bash

# 3DPrintDemon Demon Theme Installer Script v1.0.0

# Define
U="$USER"
TDIR="/home/$U/printer_data/config/.theme"
PDIR="/home/$U/printer_data/config/Previous_Themes"
SDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Themes/Demon_Theme"

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
cp  $SDIR/* $TDIR  
echo "Demon Theme installed!"

echo "Operations complete."
