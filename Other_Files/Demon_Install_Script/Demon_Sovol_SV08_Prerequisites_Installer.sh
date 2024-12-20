

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified SV08 Installer Script v1.0.0
# DO NOT USE FOR OTHER PRINTERS!!

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
DDIR="/home/$U/klipper/klippy/extras/display"
KDIR="/home/$U/printer_data/config/KAMP_LiTE"
# $RGB="/home/$U/printer_data/config/RGB_LEDs.cfg"
# $HSS="/home/$U/printer_data/config/Heat_Soak_Sovol_SV08.cfg"

DIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified"
PDIR="/home/$U/printer_data/config/Previous_Demon_Macros"


if [ ! -d "$KDIR" ]; then
    # Make Directory
    mkdir "$KDIR"
    echo "Directory $KDIR created."
    cd $KDIR
    wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/KAMP_Settings.cfg -O KAMP_Settings.cfg --backups=0
    wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/Line_Purge.cfg -O Line_Purge.cfg --backups=0
    wget https://github.com/3DPrintDemon/KAMP_LiTE/releases/download/v1.0/Smart_Park.cfg -O Smart_Park.cfg --backups=0
else
    echo "KAMP_LiTE directory already exists."
fi

# if [ ! -f "/home/$U/printer_data/config/RGB_LEDs.cfg" ]; then
if [ ! -f "$CDIR/RGB_LEDs.cfg" ]; then
    echo "RGB_LEDs.cfg file does not exist."
    cd $CDIR
    wget https://raw.githubusercontent.com/3DPrintDemon/Voron-Stealthburner/refs/heads/main/Firmware/RGB_LEDs.cfg -O RGB_LEDs.cfg --backups=0

    else
    echo "RGB_LEDs.cfg file already exists."
fi

# if [ ! -f "/home/$U/printer_data/config/Heat_Soak_Sovol_SV08.cfg" ]; then
if [ ! -f "$CDIR/Heat_Soak_Sovol_SV08.cfg" ]; then
    echo "Heat_Soak_Sovol_SV08.cfg file does not exist."
    cd $CDIR
    wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak_Sovol_SV08.cfg -O Heat_Soak_Sovol_SV08.cfg --backups=0

else
    echo "Heat_Soak_Sovol_SV08.cfg file already exists."
fi


# prompting
read -p "Do you want to install the Demon Stock Display menu system? - NOT FOR MAINLINE SYSTEMS. STOCK PRINTER ONLY!!. (y)Yes/(n)No:  " choice

# action
case $choice in
[yY]* ) echo "Attempting SV08 Demon Stock Display Config installation!"
    if [ -d "$DDIR" ]; then
        cd $DDIR
        echo "display.cfg backup created"
        wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/display.cfg --backups=1
        echo "menu.cfg backup created"
        wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/menu.cfg --backups=1
        cd $CDIR
        echo "SV08 Demon Stock Display Config installer actions complete"
    else
        # if [ ! -f "/home/$U/printer_data/config/demon_SV08_ML_display_v1.0.cfg" ]; then
         if [ ! -f "$CDIR/demon_SV08_ML_display_v1.0.cfg" ]; then
            echo "It seems you do not have a stock system, installing Demon_SV08_Mainline_v1.0.cfg please remember to include it in your printer.cfg!"
            cd $CDIR 
            wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/demon_SV08_ML_display_v1.0.cfg --backups=1
            echo "SV08 Demon Stock Display Config installer actions complete"
        else
            echo "demon_SV08_ML_display_v1.0.cfg file already exists."
        fi
    fi
    echo "Install complete! Please restat Klipper to use your new menu system." ;;
[nN]* ) echo "Installer actions complete" ;;
*) exit ;;
esac

echo "End of line."