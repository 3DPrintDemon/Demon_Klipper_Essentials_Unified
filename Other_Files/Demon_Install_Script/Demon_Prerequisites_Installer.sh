

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified Prerequisites Installer Script

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
KDIR="/home/$U/printer_data/config/KAMP_LiTE"

DIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified"
PDIR="/home/$U/printer_data/config/Previous_Demon_Macros"

echo "
************************************************************************************************
                   Weclome to the 3DPrintDemon Klipper Essentials Unified 
                           Prerequisites Installer Script v1.0.0
************************************************************************************************

Starting installer..."
################################################################################################################################################################

echo "
Scanning for Pre-existing KAMP_LiTE directories...."

if [ ! -d "$KDIR" ]; then
    # Make Directory
    mkdir "$KDIR"
    echo "Directory $KDIR created."
    cd $KDIR
    wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/KAMP_Settings.cfg -O KAMP_Settings.cfg --backups=0
    wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/Line_Purge.cfg -O Line_Purge.cfg --backups=0
    wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/Smart_Park.cfg -O Smart_Park.cfg --backups=0
    cd $CDIR
else
    echo "KAMP_LiTE directory already exists."
    # prompting
    read -p "Would you like to overwrite your existing files? Make a selection with care...! (y)Yes/(n)No:  " choice

    # action
    case $choice in
    [yY]* ) echo "Ok overwritting KAMP_LiTE files in $KDIR"
        cd $KDIR
        wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/KAMP_Settings.cfg -O KAMP_Settings.cfg --backups=0
        wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/Line_Purge.cfg -O Line_Purge.cfg --backups=0
        wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/Smart_Park.cfg -O Smart_Park.cfg --backups=0
        cd $CDIR
        ;;

    [nN]* ) echo "Sure thing, leaving your existing KAMP_LiTE files in place! Phew close one!"
    ;;
    *) exit ;;
    esac

fi

################################################################################################################################################################

echo "
************************************************************************************************"

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
            *) exit ;;
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
            *) exit ;;
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
            *) exit ;;
            esac

        fi ;;
    
    *) exit ;;
    esac

################################################################################################################################################################

echo "
************************************************************************************************"

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
            *) exit ;;
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
            *) exit ;;
            esac

        fi ;;
    
    [3]* ) echo "You chose not to install any NeopPixel LED files."
    ;;
    *) exit ;;
    esac
;;

[nN]* ) echo "NeoPixel files not installed."
;;
*) exit ;;
esac

echo "
************************************************************************************************
Prerequisites files install complete!
************************************************************************************************
"

echo "Almost done.......

************************************************************************************************"

# prompting
read -p "Would you like run the full 3DPrintDemon Klipper Essentials Unified Installer now directly? (y)Yes/(n)No:  " choice
   
# action
case $choice in
[yY]* ) echo "Running 3DPrintDemon Klipper Essentials Unified installer script."
    wget -O - https://raw.githubusercontent.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/refs/heads/main/Other_Files/Demon_Install_Script/Demon_Klipper_Essentials_Installer.sh | bash
     ;;

[nN]* ) echo "Finishing, exiting 3DPrintDemon Klipper Essentials Unified Prerequisites Installer!"
            ;;

*) exit ;;
 esac
