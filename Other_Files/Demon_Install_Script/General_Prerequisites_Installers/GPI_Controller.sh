

#!/bin/bash
# 3DPrintDemon Klipper Essentials Unified GPI Controller Script

# Define
U="$USER"
CDIR="/home/$U/printer_data/config"
KDIR="/home/$U/printer_data/config/KAMP_LiTE"

DDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified"
PDIR="/home/$U/printer_data/config/Previous_Demon_Macros"

IDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Install_Script/General_Prerequisites_Installers"
TDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_Themes/Demon_Themes_Installers"
RESTART="GPI_Controller.sh"
KAMPL="General_KAMP_LiTE_Installer.sh"
HSOAK="General_Heat_Soak_Installer.sh"
NEO="General_NeoPixel_Installer.sh"
THEME="Demon_Mainsail_Theme_Installer.sh"

GEN="GPI_Controller.sh"
SOVOL="SPI_Controller.sh"


echo "GPI_Controller starting...."
################################################################################################

bash $IDIR/$KAMPL

wait

bash $IDIR/$HSOAK

wait

bash $IDIR/$NEO

wait

bash $TDIR/$THEME

echo "
************************************************************************************************
Prerequisites files install complete!
************************************************************************************************
"

echo "Finishing 3DPrintDemon Klipper Essentials Unified Prerequisites Installer.
Exiting GPI_Controller....

************************************************************************************************"

echo ""
