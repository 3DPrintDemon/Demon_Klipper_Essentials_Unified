

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified SVPI Controller Script

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/General_Prerequisites_Installers"
TDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Themes/Demon_Themes_Installers"
RESTART="SVPI_Controller.sh"
KAMPL="General_KAMP_LiTE_Installer.sh"
THEME="Demon_Mainsail_Theme_Installer.sh"

echo "SVPI_Controller starting...."
################################################################################################

bash $IDIR/$KAMPL

wait

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

wait

bash $TDIR/$THEME

echo "
************************************************************************************************
Prerequisites files install complete!
************************************************************************************************
"

echo "Finishing 3DPrintDemon Klipper Essentials Unified Prerequisites Installer.
Exiting SVPI_Controller....

************************************************************************************************"

echo ""
