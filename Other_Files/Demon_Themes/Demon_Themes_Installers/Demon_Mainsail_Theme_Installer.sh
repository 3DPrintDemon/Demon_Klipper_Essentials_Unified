#!/bin/bash

# 3DPrintDemon Demon Theme Installer Script v1.0.0

# Define
U="$USER"
IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/.Demon_Themes/Demon_Themes_Installers"
RESTART="Demon_Mainsail_Theme_Installer.sh"
DEMON="Demon_Theme_Installer.sh"
DVOR="Demon_Voron_Theme_Installer.sh"
DTASTIC="Demon_Tastic_Theme_Installer.sh"
SOVOL="Demon_Sovol_Theme_Installer.sh"
SICE="Demon_Sovol_Ice_Theme_Installer.sh"

echo "
************************************************************************************************
              Weclome to the 3DPrintDemon Mainsail Theme Installer Script v1.0.0
************************************************************************************************

Starting installer..."

# prompting
read -p "Would you like to install a Mainsail Theme? (y)Yes/(n)No: " choice

# action
case $choice in
[yY]* ) echo "Ok great, loading options...!"
    # prompting
    read -p "Install a Theme for your printer. Make a selection...
    1. Demon Theme - generic theme with scorching flames & smoking hot look!
    2. Demon Voron Theme - same as above but with Voron logo.
    3. Demon Tastic Theme - same colours as above but with many Demon faces!
    4. Demon Sovol Theme - sovol brand inspired theme, cool relaxed feel.
    5. Demon Sovol Ice Theme - Same colours as above but with ice background.
    6. I changed my mind, don't install anything.
    (1)/(2)/(3)/(4)/(5)/(6): " choice

    # action
    case $choice in
    [1]* ) echo "Installing Demon Theme...."
        bash $IDIR/$DEMON
        echo "Saving install state & exiting..."
        echo "SAVE_VARIABLE VARIABLE=demon_theme_installed VALUE=True" >~/printer_data/comms/klippy.serial
        ;;

    [2]* ) echo "Installing Demon Voron Theme...."
        bash $IDIR/$DVOR
        echo "Saving install state & exiting..."
        echo "SAVE_VARIABLE VARIABLE=demon_theme_installed VALUE=True" >~/printer_data/comms/klippy.serial
        ;;

    [3]* ) echo "Installing Demon Tastic Theme...."
        bash $IDIR/$DTASTIC
        echo "Saving install state & exiting..."
        echo "SAVE_VARIABLE VARIABLE=demon_theme_installed VALUE=True" >~/printer_data/comms/klippy.serial
        ;;
    
    
    [4]* ) echo "Installing Demon Sovol Theme...."
        bash $IDIR/$SOVOL
        echo "Saving install state & exiting..."
        echo "SAVE_VARIABLE VARIABLE=demon_theme_installed VALUE=True" >~/printer_data/comms/klippy.serial
        ;;

    [5]* ) echo "Installing Demon Sovol Ice Theme...."
        bash $IDIR/$SICE
        echo "Saving install state & exiting..."
        echo "SAVE_VARIABLE VARIABLE=demon_theme_installed VALUE=True" >~/printer_data/comms/klippy.serial
        ;;

    [6]* ) echo "Exitiing without installing a Theme...."  
        ;;
    
    *) echo "Unrecognised choice please try again..." 
        bash $IDIR/$RESTART 
        ;;
    
    esac
;;

[nN]* ) echo "Ok skipping Theme install..."
;;

*) echo "Unrecognised choice please try again..." 
    bash $IDIR/$RESTART 
;;
  
esac

