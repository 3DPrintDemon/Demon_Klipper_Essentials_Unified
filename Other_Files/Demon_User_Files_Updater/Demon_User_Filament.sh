 #!/bin/bash

 echo "Extracting Demon User files from local cloned directory. Backups will be created if needed"

 U="$USER"
 DIR="/home/$U/printer_data/config/Demon_User_Files"
 PDIR="/home/$U/printer_data/config/Demon_User_Files/Previous_Versions"

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
     echo "Directory $DIR already exists, copying files." 
     
     if [ "$(ls -A $DIR)" ]; then
         echo "Directory $DIR is not empty"
         
         if [ ! -d "$PDIR" ]; then
             # Make Directory
             mkdir "$PDIR"
             echo "Directory $PDIR created."
             
         else
             echo "Directory $PDIR already exists."
         fi

         cp /home/$U/printer_data/config/Demon_User_Files/demon_user_settings_filament_variables_v*.cfg /home/$U/printer_data/config/Demon_User_Files/Previous_Versions --backup=numbered
         rm /home/$U/printer_data/config/Demon_User_Files/demon_user_settings_filament_variables_v*.cfg
     
     else
         echo "Directory $DIR is empty"
     fi        
 fi

 cp /home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/DEMON_User_Files_SOURCE/demon_user_settings_filament_variables_v*.cfg /home/$U/printer_data/config/Demon_User_Files --backup=numbered

 echo "Operations complete."
