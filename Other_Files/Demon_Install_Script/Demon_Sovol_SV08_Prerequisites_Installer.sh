

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified SV08 Installer Script v1.0.1
# DO NOT USE FOR OTHER PRINTERS!!

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
DDIR="/home/$U/klipper/klippy/extras/display"
KDIR="/home/$U/printer_data/config/KAMP_LiTE"
UFDIR="/home/$U/printer_data/config/Demon_User_Files"

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
    echo "KAMP_LiTE directory already exists. Skipping install."
fi

if [ ! -f "$CDIR/RGB_LEDs.cfg" ]; then
    echo "RGB_LEDs.cfg file does not exist."
    cd $CDIR
    wget https://raw.githubusercontent.com/3DPrintDemon/Voron-Stealthburner/refs/heads/main/Firmware/RGB_LEDs.cfg -O RGB_LEDs.cfg --backups=0

    else
    echo "RGB_LEDs.cfg file already exists. Skipping install."
fi

if [ ! -f "$CDIR/Heat_Soak_Sovol_SV08.cfg" ]; then
    echo "Heat_Soak_Sovol_SV08.cfg file does not exist."
    cd $CDIR
    wget https://github.com/3DPrintDemon/Non_Blocking_Wait/releases/download/Heat_Soak_Timers_V1.0/Heat_Soak_Sovol_SV08.cfg -O Heat_Soak_Sovol_SV08.cfg --backups=0

else
    echo "Heat_Soak_Sovol_SV08.cfg file already exists. Skipping install."
fi


# prompting
read -p "Do you want to install the Demon Sovol SV08 Stock Display menu system? Recommended! - (y)Yes/(n)No:  " choice

# action
case $choice in
[yY]* ) echo "Attempting SV08 Demon Stock Display Config installation!"
    if [ -d "$DDIR" ]; then
        cd $DDIR
        echo "display.cfg backup created inside directory $DDIR"
        wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/display.cfg --backups=1
        echo "menu.cfg backup created inside directory $DDIR"
        wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/menu.cfg --backups=1
        cd $CDIR
        echo "Demon SV08 Stock Display Config installer actions complete"
        echo "Install complete! Please restat Klipper to use your new menu system."
    else
        if [ -d "$UFDIR" ]; then
            if [ ! -f "$UFDIR/demon_SV08_ML_display_v1.0.cfg" ]; then
                echo "Mainline system detected, installing Demon_SV08_Mainline_v1.0.cfg in directory $UFDIR"
                cd $UFDIR 
                wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/demon_SV08_ML_display_v1.0.cfg --backups=1
                cd $CDIR
                echo "Demon SV08 Stock Display Config installer actions complete"
                echo "Install complete! Please restart Klipper to use your new menu system."
        
            else
                echo "demon_SV08_ML_display_v1.0.cfg file already exists."
            fi
            
        else
            echo "$UFDIR does not exist, please check your system or install the main macro files first, demon_SV08_ML_display_v1.0.cfg cancelled!"
        fi
    fi
    echo "Installer actions complete." ;;
[nN]* ) echo "Installer actions complete" ;;
*) exit ;;
esac

echo "End of line."
