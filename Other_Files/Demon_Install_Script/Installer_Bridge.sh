#!/bin/bash

# 3DPrintDemon Installer Bridge Script v1.0.0

# Define
U="$USER"
DDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified"
IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/General_Prerequisites_Installers"
RDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script"
RESTART="Installer_Bridge.sh"
GEN="GPI_Controller.sh"
SOVOL="SPI_Controller.sh"

if [ ! -d "$DDIR" ]; then
   echo "Directory $DDIR does not exist, Installation process CANCELLED! 
   Please ensure that DKEU is correctly instslled on your system."

else 
    echo "$DDIR successfully loacated."
    echo "
************************************************************************************************"

    if [ "$(ls -A $DUF)" ]; then    
        # prompting
        read -p "Preparing the Prerequisites installers. Please choose which one to use...
            1. General - Use with any printer from a Voron to Ender, including Sovol SV08 MAX printers.
            2. Model Specific - Use with ONLY an original Sovol SV08 (350x350) NOT MAX!
            3. Don't install anything, I want the hassle of doing it all manually myself later.
           (1)/(2)/(3): " choice

            # action
            case $choice in
            [1]* ) echo "Running general installer...."
                bash $IDIR/$GEN
                ;;

            [2]* ) echo "Running Sovol SV08 model specific installer...."
                bash $IDIR/$SOVOL
                ;;

            [3]* ) echo "Exitiing the installer bridge, be sure to install the correct Prerequisite files before trying to use DKEU!"  
                ;;
    
            *) echo "Unrecognised choice please try again..." 
                bash $RDIR/$RESTART 
                ;;
        esac

    else
    echo "$DDIR is empty! Installation process CANCELLED! 
    Please install DKEU to continue!"

    fi

fi
