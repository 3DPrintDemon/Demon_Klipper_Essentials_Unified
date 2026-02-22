

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified Prerequisites Installer Script

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"

IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/General_Prerequisites_Installers"
RESTART="General_NeoPixel_Installer.sh"

echo "
************************************************************************************************
                   Weclome to the 3DPrintDemon Klipper Essentials Unified 
                             NeoPixel Installer Script v1.0.0
************************************************************************************************

Starting installer..."

# prompting
read -p "Do you want to install any NeoPixel files? Choose Yes if you have any NeoPixel LEDs on your printer. (y)Yes/(n)No: " choice

# action
case $choice in
[yY]* ) echo "Ok great, loading Neopixel options...!"
    # prompting
    read -p "Which file would you like? Make a selection...
    1. stealthburner_leds.cfg - toolhead NeoPixel, x1 chain.
    2. Neopixel_Control.cfg - toolhead & tophat NeoPixel, x2 chains.
    3. Don't install Neopixel files. 
    (1)/(2)/(3): " choice

    # action
    case $choice in
    [1]* ) echo "You chose to install stealthburner_leds.cfg"
        echo "Scanning for Pre-existing stealthburner_leds.cfg file...."
        if [ ! -f "$CDIR/stealthburner_leds.cfg" ]; then
            echo "stealthburner_leds.cfg file does not exist."
            cd $CDIR
            echo "Installing stealthburner_leds.cfg in $CDIR"
            wget https://raw.githubusercontent.com/3DPrintDemon/Voron-Stealthburner/refs/heads/main/Firmware/stealthburner_leds.cfg -O stealthburner_leds.cfg --backups=0
        
        else
            echo "stealthburner_leds.cfg file already exists."
            # prompting
            read -p "Would you like to overwrite your existing stealthburner_leds.cfg file? Make a selection with care...! (y)Yes/(n)No:  " choice

            # action
            case $choice in
            [yY]* ) echo "Ok overwriting stealthburner_leds.cfg in $CDIR"
                cd $CDIR
                echo "Installing stealthburner_leds.cfg in $CDIR"
                wget https://raw.githubusercontent.com/3DPrintDemon/Voron-Stealthburner/refs/heads/main/Firmware/stealthburner_leds.cfg -O stealthburner_leds.cfg --backups=0
                ;;

            [nN]* ) echo "Sure thing, leaving your existing stealthburner_leds.cfg file in place! Phew close one!"
            ;;
            *) echo "Unrecognised choice please try again..."                  
                bash $IDIR/$RESTART             
            ;;
            esac

        fi ;;

    [2]* ) echo "You chose to install Neopixel_Control.cfg"
        echo "Scanning for Pre-existing Neopixel_Control.cfg file...."
        if [ ! -f "$CDIR/Neopixel_Control.cfg" ]; then
            echo "Neopixel_Control.cfg file does not exist."
            cd $CDIR
            echo "Installing Neopixel_Control.cfg to $CDIR"
            wget https://raw.githubusercontent.com/3DPrintDemon/Voron-Stealthburner/refs/heads/main/Firmware/Neopixel_Control.cfg -O Neopixel_Control.cfg --backups=0
        
        else
            echo "Neopixel_Control.cfg file already exists."
            # prompting
            read -p "Would you like to overwrite your existing Neopixel_Control.cfg file? Make a selection with care...! (y)Yes/(n)No:  " choice

            # action
            case $choice in
            [yY]* ) echo "Ok overwriting Neopixel_Control.cfg in $CDIR"
                cd $CDIR
                echo "Installing Neopixel_Control.cfg in $CDIR"
                wget https://raw.githubusercontent.com/3DPrintDemon/Voron-Stealthburner/refs/heads/main/Firmware/Neopixel_Control.cfg -O Neopixel_Control.cfg --backups=0
                ;;

            [nN]* ) echo "Sure thing, leaving your existing Neopixel_Control.cfg file in place! Phew close one!"
            ;;
            *) echo "Unrecognised choice please try again..."
                bash $IDIR/$RESTART
            ;;
            esac

        fi ;;
    
    [3]* ) echo "You chose not to install any NeopPixel LED files."
    ;;
    *) echo "Unrecognised choice please try again..."
        bash $IDIR/$RESTART
    ;;
    esac
;;

[nN]* ) echo "NeoPixel files not installed."
;;
*) echo "Unrecognised choice please try again..."
bash $IDIR/$RESTART
;;
esac

echo "Closing NeoPixel Installer...
************************************************************************************************"


