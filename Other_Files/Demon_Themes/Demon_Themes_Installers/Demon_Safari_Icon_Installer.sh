


#!/bin/bash

# 3DPrintDemon Demon Safari Icon Installer Script v1.0.1

# Define
U="$USER"
SDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Themes/Demon_Mainsail_Safari_Icon"
TDIR="/home/$U/mainsail/img/icons"
ATI="apple-touch-icon-180x180.png"


echo "Installing Demon Safari Icon."

# Check if directory not exist
if [ ! -d "$TDIR" ]; then
    echo "$TDIR does not exist."
    echo "Exiting."

else
    cp $SDIR/$ATI $TDIR --backup=numbered
fi

echo "Operations complete."