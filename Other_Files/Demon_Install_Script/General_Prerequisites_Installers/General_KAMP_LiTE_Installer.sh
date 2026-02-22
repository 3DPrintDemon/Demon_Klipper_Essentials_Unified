

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified Prerequisites Installer Script

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
KDIR="/home/$U/printer_data/config/KAMP_LiTE"
IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/General_Prerequisites_Installers"
RESTART="General_KAMP_LiTE_Installer.sh"

echo "
************************************************************************************************
                   Weclome to the 3DPrintDemon Klipper Essentials Unified 
                             KAMP_LiTE Installer Script v1.0.0
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
    echo "KAMP_LiTE installed"
    
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
        echo "KAMP_LiTE installed"
        ;;

    [nN]* ) echo "Sure thing, leaving your existing KAMP_LiTE files in place! Phew close one!"
    ;;
    
    *) echo "Unrecognised choice please try again..." 
        bash $IDIR/$RESTART
    ;;

    esac

fi

################################################################################################################################################################

echo "Closing KAMP_LiTE Installer...
************************************************************************************************"