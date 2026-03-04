

#!/bin/bash

# 3DPrintDemon Demon Theme Uninstaller Script v1.0.0

# Define
U="$USER"
TDIR="/home/$U/printer_data/config/.theme"
PDIR="/home/$U/printer_data/config/Previous_Themes"

# Check if directory not exist
if [ ! -d "$TDIR" ]; then
    echo "$TDIR does not exist."
    echo "Exiting."
    
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
            echo "An old DEMON theme was detected! Removing files!"
            rm $TDIR/*
            
        fi
    fi
fi

echo "Operations complete."