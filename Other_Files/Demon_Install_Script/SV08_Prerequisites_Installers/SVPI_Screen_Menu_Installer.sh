

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified SVPI Controller Script

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
DSPDIR="/home/$U/klipper/klippy/extras/display"
UFDIR="/home/$U/printer_data/config/Demon_User_Files"
IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/General_Prerequisites_Installers"
RESTART="SVPI_Screen_Menu_Installer.sh"

# prompting
read -p "Do you want to install the Demon Sovol SV08 Stock Display menu system? Recommended! - (y)Yes/(n)No:  " choice

# action
case $choice in
[yY]* ) echo "Attempting SV08 Demon Stock Display Config installation!"
    
    # prompting
    read -p "Are you Running a stock Sovol system or modified Mainline Klipper system - (s)Stock/(m)Mainline:  " choice
    
    # action
    case $choice in
    [sS]* ) echo "Ok Sovol stock system it is!"
        if [ -d "$DSPDIR" ]; then
            cd $DSPDIR
            echo "display.cfg backup created inside directory $DSPDIR"
            wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/display.cfg --backups=1
            echo "menu.cfg backup created inside directory $DSPDIR"
            wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/menu.cfg --backups=1
            cd $CDIR
            echo "Demon SV08 Stock Display Config installer actions complete"
            echo "Install complete! Please restart Klipper to use your new menu system."

        else
            echo "$DSPDIR does not exist, cancelling this install!"
        fi ;;
    
    [mM]* ) echo "Ok modified Mainline Klipper system it is!"
        if [ -d "$UFDIR" ]; then
            if [ ! -f "$UFDIR/demon_SV08_ML_display_v1.1.cfg" ]; then
                echo "Installing Demon_SV08_Mainline_v1.1.cfg in directory $UFDIR"
                cd $UFDIR 
                wget https://github.com/3DPrintDemon/SV08/releases/download/v1.0/demon_SV08_ML_display_v1.1.cfg --backups=1
                cd $CDIR
                echo "Demon SV08 Mainline Display Config installer actions complete"
                echo "Install complete! Please restart Klipper to use your new menu system."
        
            else
                echo "demon_SV08_ML_display_v1.1.cfg file already exists."
            fi
            
        else
            echo "$UFDIR does not exist, please check your system or install the main macro files first, demon_SV08_ML_display_v1.1.cfg install cancelled!"
        fi ;;

    *) echo "Unrecognised choice please try again..." 
        bash $IDIR/$RESTART
    ;;
    esac    
    ;;
    
[nN]* ) echo "Not installing menu files."
;;
*) echo "Unrecognised choice please try again..."
bash $IDIR/$RESTART 
;;
esac

echo "Closing Screen_Menu Installer...
************************************************************************************************"