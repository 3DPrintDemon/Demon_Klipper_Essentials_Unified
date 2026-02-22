

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified Prerequisites Installer Script

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/General_Prerequisites_Installers"
RESTART="General_Heat_Soak_Installer.sh"

echo "
************************************************************************************************
                   Weclome to the 3DPrintDemon Klipper Essentials Unified 
                             HEAT_SOAK Installer Script v1.0.0
************************************************************************************************

Starting installer..."

# prompting file select
read -p "Install the correct Heat_Soak file for your printer. Make a selection...
    1. Heat_Soak.cfg - basic heat soak that will control white printer lights or set as a dummy pin.
    2. Heat_Soak_SB_LEDs.cfg - Heat Soak for Voron Stealthburner or similar toolheads with NeoPixels.
    3. Heat_Soak_Toolhead_LEDs.cfg - for use with the Neopixel_Control.cfg, when using x2 chains.
    (1)/(2)/(3): " choice

    # action
    case $choice in
    [1]* ) echo "You chose to install Heat_Soak.cfg"
        echo "Scanning for Pre-existing Heat_Soak.cfg file...."
        if [ ! -f "$CDIR/Heat_Soak.cfg" ]; then
            echo "Heat_Soak.cfg file does not exist."
            cd $CDIR
            echo "Installing Heat_Soak.cfg in $CDIR"
            wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak.cfg -O Heat_Soak.cfg --backups=0
        
        else
            echo "Heat_Soak.cfg file already exists."
            # prompting
            read -p "Would you like to overwrite your existing Heat_Soak.cfg file? Make a selection with care...! (y)Yes/(n)No:  " choice

            # action
            case $choice in
            [yY]* ) echo "Ok overwriting Heat_Soak.cfg in $CDIR"
                cd $CDIR
                echo "Installing Heat_Soak.cfg in $CDIR"
                wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak.cfg -O Heat_Soak.cfg --backups=0
                ;;

            [nN]* ) echo "Sure thing, leaving your existing Heat_Soak.cfg file in place! Phew close one!"
            ;;
            *) echo "Unrecognised choice please try again..." 
                bash $IDIR/$RESTART
            ;;
            esac

        fi ;;

    [2]* ) echo "You chose to install Heat_Soak_SB_LEDs.cfg"
        echo "Scanning for Pre-existing Heat_Soak_SB_LEDs.cfg file...."
        if [ ! -f "$CDIR/Heat_Soak_SB_LEDs.cfg" ]; then
            echo "Heat_Soak_SB_LEDs.cfg file does not exist."
            cd $CDIR
            echo "Installing Heat_Soak_SB_LEDs.cfg to $CDIR"
            wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak_SB_LEDs.cfg -O Heat_Soak_SB_LEDs.cfg --backups=0
        
        else
            echo "Heat_Soak_SB_LEDs.cfg file already exists."
            # prompting
            read -p "Would you like to overwrite your existing Heat_Soak_SB_LEDs.cfg file? Make a selection with care...! (y)Yes/(n)No:  " choice

            # action
            case $choice in
            [yY]* ) echo "Ok overwriting Heat_Soak_SB_LEDs.cfg in $CDIR"
                cd $CDIR
                echo "Installing Heat_Soak_SB_LEDs.cfg in $CDIR"
                wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak_SB_LEDs.cfg -O Heat_Soak_SB_LEDs.cfg --backups=0
                ;;

            [nN]* ) echo "Sure thing, leaving your existing Heat_Soak_SB_LEDs.cfg file in place! Phew close one!"
            ;;
            *) echo "Unrecognised choice please try again..." 
                bash $IDIR/$RESTART
            ;;
            esac

        fi ;;
    
    [3]* ) echo "You chose to install Heat_Soak_Toolhead_LEDs.cfg"
        echo "Scanning for Pre-existing Heat_Soak_Toolhead_LEDs.cfg file...."
        if [ ! -f "$CDIR/Heat_Soak_Toolhead_LEDs.cfg" ]; then
            echo "Heat_Soak_Toolhead_LEDs.cfg file does not exist."
            cd $CDIR
            echo "Installing Heat_Soak_Toolhead_LEDs.cfg to $CDIR"
            wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak_Toolhead_LEDs.cfg -O Heat_Soak_Toolhead_LEDs.cfg --backups=0
        
        else
            echo "Heat_Soak_Toolhead_LEDs.cfg file already exists."
            # prompting
            read -p "Would you like to overwrite your existing Heat_Soak_Toolhead_LEDs.cfg file? Make a selection with care...! (y)Yes/(n)No:  " choice

            # action
            case $choice in
            [yY]* ) echo "Ok overwriting Heat_Soak_Toolhead_LEDs.cfg in $CDIR"
                cd $CDIR
                echo "Installing Heat_Soak_Toolhead_LEDs.cfg in $CDIR"
                wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak_Toolhead_LEDs.cfg -O Heat_Soak_Toolhead_LEDs.cfg --backups=0
                ;;

            [nN]* ) echo "Sure thing, leaving your existing Heat_Soak_Toolhead_LEDs.cfg file in place! Phew close one!"
            ;;
            *) echo "Unrecognised choice please try again..." 
                bash $IDIR/$RESTART
            ;;
            esac

        fi ;;
    
    *) echo "Unrecognised choice please try again..." 
        bash $IDIR/$RESTART
    ;;
    esac

echo "Closing HEAT_SOAK Installer...
************************************************************************************************"




