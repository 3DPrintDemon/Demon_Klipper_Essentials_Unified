#!/bin/bash



U="$USER"
DIR="/home/$U/printer_data/config/Demon_User_Files"
PDIR="/home/$U/printer_data/config/Demon_User_Files/Previous_Versions"
SDIR="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/DEMON_User_Files_SOURCE"
DUS="demon_user_settings_v*.cfg"
DUSCV="demon_user_settings_cleaner_variables_v*.cfg"
DCE="demon_custom_expansion_v*.cfg"
DUSFV="demon_user_settings_filament_variables_v*.cfg"

# demon_user_settings_v*.cfg
# demon_user_settings_cleaner_variables_v*.cfg
# demon_user_settings_filament_variables_v*.cfg
# demon_custom_expansion_v*.cfg

# Check directory not exist
if [ ! -d "$DIR" ]; then
    # Make Directory
    mkdir "$DIR"
    echo "Directory $DIR created."
     
else
    echo "Directory $DIR already exists." 
     
    if [ "$(ls -A $DIR)" ]; then
         echo "Directory $DIR is not empty"
         
         if [ ! -d "$PDIR" ]; then
             # Make Directory
             mkdir "$PDIR"
             echo "Directory $PDIR created."

         else
             echo "Directory $PDIR already exists."
         fi

         

         if [ -f $DIR/$DUS ]; then
            echo "Moving old $DUS to $PDIR"
            mv $DIR/$DUS $PDIR --backup=numbered

         else 
             echo "No previous version of $DUS found to move."
         fi


         if [ -f $DIR/$DUSCV ]; then
            echo "Moving old $DUSCV to $PDIR"
            mv $DIR/$DUSCV $PDIR --backup=numbered

         else 
             echo "No previous version of $DUSCV found to move."
         fi


         if [ -f $DIR/$DCE ]; then
            echo "Moving old $DCE to $PDIR"
            mv $DIR/$DCE $PDIR --backup=numbered

         else 
             echo "No previous version of $DCE found to move."
         fi


         if [ -f $DIR/$DUSFV ]; then
            echo "Moving old $DUSFV to $PDIR"
            mv $DIR/$DUSFV $PDIR --backup=numbered

         else 
             echo "No previous version of $DUSFV found to move."
         fi
        
 
    else
        echo "Directory $DIR is empty"
    fi        
fi

wait
echo "Auto extracting new version of $DUS"
cp $SDIR/$DUS $DIR

echo "Auto extracting new version of $DUSCV"
cp $SDIR/$DUSCV $DIR

echo "Auto extracting new version of $DCE"
cp $SDIR/$DCE $DIR

echo "Auto extracting new version of $DUSFV"
cp $SDIR/$DUSFV $DIR

wait

echo "Requesting Klipper to set SAVE_VARIABLE VARIABLE=first_boot VALUE=False"
echo "SAVE_VARIABLE VARIABLE=first_boot VALUE=False" >~/printer_data/comms/klippy.serial

echo "Requesting Klipper to set SAVE_VARIABLE VARIABLE=first_boot_msg VALUE=True"
echo "SAVE_VARIABLE VARIABLE=first_boot_msg VALUE=True" >~/printer_data/comms/klippy.serial

echo "Requesting Klipper to set SAVE_VARIABLE VARIABLE=version_dvars_updated VALUE=False"
echo "SAVE_VARIABLE VARIABLE=version_dvars_updated VALUE=False" >~/printer_data/comms/klippy.serial

wait

echo "Requesting Klipper to RESTART"
echo "RESTART" >~/printer_data/comms/klippy.serial

echo "Operations complete."
