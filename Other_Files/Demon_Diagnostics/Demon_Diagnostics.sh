

#!/bin/bash

# 3DPrintDemon Klipper Essentials Unified System Report Generator Script v1.0.3

# Time/Date
TIME="$(date)"

# Colour
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 6`
reset=`tput sgr0`
# echo "${red}red text ${green}green text${reset}"

# Define DIR
U="$USER"
S="sovol"
B="biqu"
DIR="/home/$U/printer_data/config"
DEMON="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified"
DEMONUF="/home/$U/printer_data/config/Demon_User_Files"
EDUF="/home/$U/printer_data/config/Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater"
KAMP="/home/$U/printer_data/config/KAMP_LiTE"

# Include Searches
SDEM=$(grep -Fxc "[include ./Demon_Klipper_Essentials_Unified/*.cfg]" $DIR/printer.cfg)
SDEMB=$(grep -Fxc "[include Demon_Klipper_Essentials_Unified/*.cfg]" $DIR/printer.cfg)
SDUF=$(grep -Fxc "[include ./Demon_User_Files/*.cfg]" $DIR/printer.cfg)
SDUFB=$(grep -Fxc "[include Demon_User_Files/*.cfg]" $DIR/printer.cfg)
SEDUF=$(egrep -c '^\[include ./Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_' $DIR/printer.cfg)
SEDUFB=$(egrep -c '^\[include Demon_Klipper_Essentials_Unified/Other_Files/Demon_User_Files_Updater/Extract_Demon_User_Files_' $DIR/printer.cfg)
SKPL=$(grep -Fxc "[include ./KAMP_LiTE/*.cfg]" $DIR/printer.cfg)
SKPLB=$(grep -Fxc "[include KAMP_LiTE/*.cfg]" $DIR/printer.cfg)
SMNSL=$(grep -Fxc "[include ./mainsail.cfg]" $DIR/printer.cfg)
SMNSLB=$(grep -Fxc "[include mainsail.cfg]" $DIR/printer.cfg)
SHSK=$(egrep -ic '^\[include ./Heat_Soak' $DIR/printer.cfg)
SHSKB=$(egrep -ic '^\[include Heat_Soak' $DIR/printer.cfg)
SMYMC=$(grep -Fxc "[include ./My_Macros.cfg]" $DIR/printer.cfg)
SMYMCB=$(grep -Fxc "[include My_Macros.cfg]" $DIR/printer.cfg)

SSMF=$(grep -Fxc "[include ./Macro.cfg]" $DIR/printer.cfg)
SSMFB=$(grep -Fxc "[include Macro.cfg]" $DIR/printer.cfg)
SSMLMF=$(grep -Fxc "[include ./sovol-macros.cfg]" $DIR/printer.cfg)
SSMLMFB=$(grep -Fxc "[include sovol-macros.cfg]" $DIR/printer.cfg)

SNPCTRL=$(grep -Fxc "[include ./Neopixel_Control.cfg]" $DIR/printer.cfg)
SNPCTRLB=$(grep -Fxc "[include Neopixel_Control.cfg]" $DIR/printer.cfg)
SRGBLED=$(grep -Fxc "[include ./RGB_LEDs.cfg]" $DIR/printer.cfg)
SRGBLEDB=$(grep -Fxc "[include RGB_LEDs.cfg]" $DIR/printer.cfg)
SSBLED=$(grep -Fxc "[include ./stealthburner_leds.cfg]" $DIR/printer.cfg)
SSBLEDB=$(grep -Fxc "[include stealthburner_leds.cfg]" $DIR/printer.cfg)

# printer.cfg Searches
SPSVV=$(grep -Fxc "[save_variables]" $DIR/printer.cfg)
SPSVVD=$(grep -Fxc "filename: ~/demon_vars.cfg" $DIR/printer.cfg)
SPSVVDB=$(grep -Fxc "filename = ~/demon_vars.cfg" $DIR/printer.cfg)
SPRESP=$(grep -Fxc "[respond]" $DIR/printer.cfg)
SPFM=$(grep -Fxc "[force_move]" $DIR/printer.cfg)
SPFMT=$(grep -Fxc "enable_force_move: True" $DIR/printer.cfg)
SPPR=$(grep -Fxc "[pause_resume]" $DIR/printer.cfg)
SPXTRDR=$(grep -Fxc "[extruder]" $DIR/printer.cfg)
SPMXE=$(egrep -c '^max_extrude_cross_section' $DIR/printer.cfg)
SPMXEV=$(egrep -c '^max_extrude_only_velocity' $DIR/printer.cfg)
SPEXOB=$(grep -Fxc "[exclude_object]" $DIR/printer.cfg)
SPFMN=$(grep -Fxc "[file_manager]" $DIR/moonraker.conf)
SPFMNT=$(grep -Fxc "enable_object_processing: True" $DIR/moonraker.conf)



# User Message
echo "--------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

                                     ${green}Welcome to DEMON_DIAGNOSTICS v1.0.3
                         The Demon_Klipper_Essentials_Unified System Report Generator!${reset}

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
This utility is used to check the state of your installed files needed to run the macros.
It will NOT fix anything for you or check what files you actually have inside your included directories.
The purpose is to simply inform you of their status.
--------------------------------------------------------------------------------------------------------------
NOTE: If you change names from default then this utility cannot work correctly & will report missing items.
--------------------------------------------------------------------------------------------------------------

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
MACRO SYSTEM CHECK
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo

# Demon_Klipper_Essentials_Unified CHECKS
echo "${blue}Checking Demon_Klipper_Essentials_Unified${reset}"
echo
if [ ! -d "$DEMON" ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "Directory $DEMON does not exist."
    echo "##########################################################################################################${reset}"
    echo

else 
    echo "Directory $DEMON ${green}exists${reset}."
    if [ "$(ls -A $DEMON)" ]; then
        echo "Directory $DEMON ${green}contains files${reset}."

        if [ "$SDEM" -eq 1 ] && [ "$SDEMB" -eq 0 ]; then
            echo "${green}Demon_Klipper_Essentials_Unified is included in the system.${reset}"
        
        elif [ "$SDEM" -eq 0 ] && [ "$SDEMB" -eq 1 ]; then
            echo "${green}Demon_Klipper_Essentials_Unified is included in the system.${reset}"

        elif [ "$SDEM" -gt 1 ] || [ "$SDEMB" -gt 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Demon_Klipper_Essentials_Unified is included more than once!!"
            echo "##########################################################################################################${reset}"
            echo

        elif [ "$SDEM" -eq 1 ] && [ "$SDEMB" -eq 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Demon_Klipper_Essentials_Unified is included more than once with two types of include!!"
            echo "##########################################################################################################${reset}"
            echo

        else
            echo
            echo "${red}##########################################################################################################"
            echo "Demon_Klipper_Essentials_Unified is not included."
            echo "##########################################################################################################${reset}"
            echo
        fi

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: Demon_Klipper_Essentials_Unified is empty!"
        echo "##########################################################################################################${reset}"
        echo    
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo
# Demon_User_Files CHECKS
echo "${blue}Checking Demon_User_Files${reset}"
echo
if [ ! -d "$DEMONUF" ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "Directory $DEMONUF does not exist."
    echo "##########################################################################################################${reset}"
    echo

else
    echo "Directory $DEMONUF ${green}exists${reset}."
    if [ "$(ls -A $DEMONUF)" ]; then
        echo "Directory $DEMONUF ${green}contains files${reset}."

        if [ "$SDUF" -eq 1 ] && [ "$SDUFB" -eq 0 ]; then
            echo "${green}Demon_User_Files is included in the system.${reset}"

        elif [ "$SDUF" -eq 0 ] && [ "$SDUFB" -eq 1 ]; then
            echo "${green}Demon_User_Files is included in the system.${reset}"

        elif [ "$SDUF" -gt 1 ] || [ "$SDUFB" -gt 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Demon_User_Files is included more than once!!"
            echo "##########################################################################################################${reset}"
            echo

        elif [ "$SDUF" -eq 1 ] && [ "$SDUFB" -eq 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Demon_User_Files is defined more than once with two types of include!!"
            echo "##########################################################################################################${reset}"
            echo

        else
            echo
            echo "${red}##########################################################################################################"
            echo "Demon_User_Files is not included."
            echo "##########################################################################################################${reset}"
            echo
        fi

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: Demon_User_Files is empty!"
        echo "##########################################################################################################${reset}"
        echo    
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# Extract_Demon_User_Files CHECKS
echo "${blue}Checking Extract_Demon_User_Files${reset}"
echo
if [ ! -d "$EDUF" ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: Directory $EDUF does not exist."
    echo "##########################################################################################################${reset}"
    echo

else
    echo "Directory $EDUF ${green}exists${reset}."
    if [ "$(ls -A $EDUF)" ]; then
        echo "Directory $EDUF ${green}contains files${reset}."

        if [ "$SEDUF" -eq 1 ] && [ "$SEDUFB" -eq 0 ]; then
            echo "${green}Extract_Demon_User_Files is included in the system.${reset}"

        elif [ "$SEDUF" -eq 0 ] && [ "$SEDUFB" -eq 1 ]; then
            echo "${green}Extract_Demon_User_Filess is included in the system.${reset}"

        elif [ "$SEDUF" -gt 1 ] || [ "$SEDUFB" -gt 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Extract_Demon_User_Files is included more than once!!"
            echo "##########################################################################################################${reset}"
            echo

        elif [ "$SEDUF" -eq 1 ] && [ "$SEDUFB" -eq 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Extract_Demon_User_Files is defined more than once with two types of include!!"
            echo "##########################################################################################################${reset}"
            echo

        else
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Extract_Demon_User_Files is not included."
            echo "##########################################################################################################${reset}"
            echo
        fi
    
    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: Extract_Demon_User_Files is empty!"
        echo "##########################################################################################################${reset}"
        echo
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# Extract_Demon_User_Files CHECKS
echo "${blue}Checking KAMP_LiTE${reset}"
echo
if [ ! -d "$KAMP" ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: Directory $KAMP does not exist."
    echo "##########################################################################################################${reset}"
    echo

else
    echo "Directory $KAMP ${green}exists${reset}."
    if [ "$(ls -A $KAMP)" ]; then
        echo "Directory $KAMP ${green}contains files${reset}."

        if [ "$SKPL" -eq 1 ] && [ "$SKPLB" -eq 0 ]; then
            echo "${green}KAMP_LiTE is included in the system.${reset}"

        elif [ "$SKPL" -eq 0 ] && [ "$SKPLB" -eq 1 ]; then
            echo "${green}KAMP_LiTE is included in the system.${reset}"

        elif [ "$SKPL" -gt 1 ] || [ "$SKPLB" -gt 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: KAMP_LiTE is included more than once!!"
            echo "##########################################################################################################${reset}"
            echo

        elif [ "$SKPL" -eq 1 ] && [ "$SKPLB" -eq 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: KAMP_LiTE is defined more than once with two types of include!!"
            echo "##########################################################################################################${reset}"
            echo

        else
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: KAMP_LiTE is not included."
            echo "##########################################################################################################${reset}"
            echo
        fi

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: KAMP_LiTE is empty!"
        echo "##########################################################################################################${reset}"
        echo
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# Mainsail CHECKS
echo "${blue}Checking mainsail.cfg file${reset}"
echo
if [ ! -f "$DIR/mainsail.cfg" ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: File $DIR/mainsail.cfg file does not exist."
    echo "##########################################################################################################${reset}"
    echo

else
    echo "File $DIR/mainsail.cfg file ${green}exists${reset}."

    if [ "$SMNSL" -eq 1 ] && [ "$SMNSLB" -eq 0 ]; then
        echo "${green}mainsail.cfg file is included in the system.${reset}"

    elif [ "$SMNSL" -eq 0 ] && [ "$SMNSLB" -eq 1 ]; then
        echo "${green}mainsail.cfg file is included in the system.${reset}"

    elif [ "$SMNSL" -gt 1 ] || [ "$SMNSLB" -gt 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: mainsail.cfg file is included more than once!!"
        echo "##########################################################################################################${reset}"
        echo

    elif [ "$SMNSL" -eq 1 ] && [ "$SMNSLB" -eq 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: mainsail.cfg file is included more than once with two types of include!!"
        echo "##########################################################################################################${reset}"
        echo

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: mainsail.cfg file is not included."
        echo "##########################################################################################################${reset}"
        echo
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# My_macros.cfg CHECKS
echo "${blue}Checking My_Macros.cfg File${reset}"
echo
echo "NOTE: My_Macros.cfg should contain your mainsail.cfg _client_variable macro to use with park/pause functions"
echo
if [ "$SMNSL" -ge 1 ] || [ "$SMNSLB" -ge 1 ] && [ ! -f "$DIR/My_Macros.cfg" ]; then
    echo "${red}##########################################################################################################"
    echo "WARNING: File $DIR/My_Macros.cfg file does not exist, but mainsail.cfg is included!" 
    echo "Custom park/pause wont work correctly!"
    echo "##########################################################################################################${reset}"
    echo

elif [ "$SMNSL" -ge 0 ] || [ "$SMNSLB" -ge 0 ] && [ ! -f "$DIR/My_Macros.cfg" ]; then
    echo "${red}##########################################################################################################"
    echo "WARNING: File $DIR/My_Macros.cfg file does not exist, & mainsail.cfg is NOT included!"
    echo "Custom park/pause wont work correctly!"
    echo "##########################################################################################################${reset}"
    echo

else
    echo "File $DIR/My_Macros.cfg file ${green}exists${reset}."

    if [ "$SMYMC" -eq 1 ] && [ "$SMYMCB" -eq 0 ]; then
    echo "${green}My_Macros.cfg file is included in the system.${reset}"

    elif [ "$SMYMC" -eq 0 ] && [ "$SMYMCB" -eq 1 ]; then
    echo "${green}My_Macros.cfg file is included in the system.${reset}"

    elif [ "$SMYMC" -gt 1 ] || [ "$SMYMCB" -gt 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: My_Macros.cfg file is included more than once!!"
        echo "##########################################################################################################${reset}"
        echo

    elif [ "$SMYMC" -eq 1 ] && [ "$SMYMCB" -eq 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: My_Macros.cfg file is included more than once with two types of include!!"
        echo "##########################################################################################################${reset}"
        echo

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: My_Macros.cfg file is not included."
        echo "##########################################################################################################${reset}"
        echo
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# Sovol Macros cfg CHECKS
if [ "$U" = "$S" ] || [ "$U" = "$B" ]; then
    echo "${blue}Checking Sovol Macro File${reset}"
    echo
    echo "NOTE: When using Demon Klipper Essentials Unified on a Sovol printer the Sovol macro files need to be NOT included"
    echo "in your printer.cfg"
    echo 
    if [ -f "$DIR/Macro.cfg" ] || [ -f "$DIR/sovol-macros.cfg" ]; then
    echo "Sovol Macros cfg file found."
    
        if [ "$SSMF" -eq 0 ] || [ "$SSMFB" -eq 0 ]; then
            echo "${green}Macro.cfg file is correctly NOT included in the system.${reset}"

        elif [ "$SSMLMF" -eq 0 ] || [ "$SSMLMFB" -eq 0 ]; then
            echo "${green}sovol-macros.cfg file is correctly NOT included in the system.${reset}"
        
        elif [ "$SSMF" -ge 1 ] || [ "$SSMFB" -ge 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: Sovol Macro.cfg file is included, please comment it out!!"
            echo "##########################################################################################################${reset}"
            echo

        elif [ "$SSMLMF" -ge 1 ] || [ "$SSMLMFB" -ge 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: sovol-macros.cfg file is included, please comment it out!!"
            echo "##########################################################################################################${reset}"
            echo
        fi

    echo "--------------------------------------------------------------------------------------------------------------"
    echo 
    fi  
fi

# Heat_Soak CHECKS
echo "${blue}Checking Heat_Soak File${reset}"
echo
echo "NOTE: As there are a number of Heat_Soak variant files its down to you to make sure you have the correct one! "
echo "Recent name changes to the files might give false results if your file is older."
echo
if [ "$SHSK" -eq 1 ] && [ "$SHSKB" -eq 0 ]; then
echo "${green}Heat_Soak file is included in the system.${reset}"

elif [ "$SHSK" -eq 0 ] && [ "$SHSKB" -eq 1 ]; then
    echo "${green}Heat_Soak file is included in the system.${reset}"

elif [ "$SHSK" -gt 1 ] || [ "$SHSKB" -gt 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: Heat_Soak file is included more than once!!"
    echo "##########################################################################################################${reset}"
    echo

elif [ "$SHSK" -eq 1 ] && [ "$SHSKB" -eq 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: Heat_Soak file is included more than once with two types of include!!"
    echo "##########################################################################################################${reset}"
    echo

else
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: Heat_Soak file is not included."
    echo "##########################################################################################################${reset}"
    echo
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# NeoPixel CHECKS
echo "${blue}Checking NeoPixel lighting control cfg file${reset}"
echo
if [ -f "$DIR/Neopixel_Control.cfg" ]; then
    echo "File $DIR/Neopixel_Control.cfg ${green}exists${reset}."

    if [ "$SNPCTRL" -eq 1 ] && [ "$SNPCTRLB" -eq 0 ]; then
        echo "${green}Neopixel_Control.cfg file is included in the system.${reset}"

    elif [ "$SNPCTRL" -eq 0 ] && [ "$SNPCTRLB" -eq 1 ]; then
        echo "${green}Neopixel_Control.cfg file is included in the system.${reset}"

    elif [ "$SNPCTRL" -gt 1 ] || [ "$SNPCTRLB" -gt 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: Neopixel_Control.cfg file is included more than once!!"
        echo "##########################################################################################################${reset}"

    elif [ "$SNPCTRL" -eq 1 ] && [ "$SSNPCTRLB" -eq 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: Neopixel_Control.cfg file is included more than once with two types of include!!"
        echo "##########################################################################################################${reset}"

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: Neopixel_Control.cfg file is not included."
        echo "##########################################################################################################${reset}"
    fi

elif [ -f "$DIR/RGB_LEDs.cfg" ]; then
    echo "File $DIR/RGB_LEDs.cfg file ${green}exists${reset}."

    if [ "$SRGBLED" -eq 1 ] && [ "$SRGBLEDB" -eq 0 ]; then
        echo "${green}RGB_LEDs.cfg file is included in the system.${reset}"

    elif [ "$SRGBLED" -eq 0 ] && [ "$SRGBLEDB" -eq 1 ]; then
        echo "${green}RGB_LEDs.cfg file is included in the system.${reset}"

    elif [ "$SRGBLED" -gt 1 ] || [ "$SRGBLEDB" -gt 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: RGB_LEDs.cfg file is included more than once!!"
        echo "##########################################################################################################${reset}"

    elif [ "$SRGBLED" -eq 1 ] && [ "$SRGBLEDB" -eq 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: RGB_LEDs.cfg file is included more than once with two types of include!!"
        echo "##########################################################################################################${reset}"

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: RGB_LEDs.cfg file is not included."
        echo "##########################################################################################################${reset}"
    fi

elif [ -f "$DIR/stealthburner_leds.cfg" ]; then
    echo "File $DIR/stealthburner_leds.cfg file ${green}exists${reset}."

    if [ "$SSBLED" -eq 1 ] && [ "$SSBLEDB" -eq 0 ]; then
        echo "${green}stealthburner_leds.cfg file is included in the system.${reset}"

    elif [ "$SSBLED" -eq 0 ] && [ "$SSBLEDB" -eq 1 ]; then
        echo "${green}stealthburner_leds.cfg file is included in the system.${reset}"

    elif [ "$SSBLED" -gt 1 ] || [ "$SSBLEDB" -gt 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: stealthburner_leds.cfg file is included more than once!!"
        echo "##########################################################################################################${reset}"

    elif [ "$SSBLED" -eq 1 ] && [ "$SSBLEDB" -eq 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: stealthburner_leds.cfg file is included more than once with two types of include!!"
        echo "##########################################################################################################${reset}"

    else
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: stealthburner_leds.cfg file is not included."
        echo "##########################################################################################################${reset}"    
    fi

else
    echo
    echo "NOTE: If you have a printer with no NeoPixels & you intentionally have't installed"
    echo "the file please ignore this warning, otherwise please check this."
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: No NeoPixel LED control file found."
    echo "##########################################################################################################${reset}"
fi
echo
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
PRINTER.CFG SECTIONS CHECK
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo

# save_variables Checks
echo "${blue}Checking save_variables printer.cfg Section${reset}"
echo
if [ "$SPSVV" -eq 1 ]; then
    echo "${green}The save_variables section is defined in the printer.cfg file.${reset}"
        if [ "$SPSVVD" -eq 1 ] && [ "$SPSVVDB" -eq 0 ]; then
            echo "${green}The correct file path is defined for your saved_variables.${reset}"
        
        elif [ "$SPSVVD" -eq 0 ] && [ "$SPSVVDB" -eq 1 ]; then
            echo "${green}The correct file path is defined with for your saved_variables.${reset}"

        elif [ "$SPSVVD" -gt 1 ] || [ "$SPSVVDB" -gt 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: The correct file path is defined more than once!!"
            echo "##########################################################################################################${reset}"
            echo

        elif [ "$SPSVVD" -eq 1 ] && [ "$SPSVVDB" -eq 1 ]; then
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: The correct file path is defined more than once with two different definitions!!"
            echo "##########################################################################################################${reset}"
            echo

        else
            echo
            echo "${red}##########################################################################################################"
            echo "WARNING: The correct file path is NOT defined for your saved_variables."
            echo "##########################################################################################################${reset}"
            echo
        fi

elif [ "$SPSVV" -eq 0 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The save_variables section is NOT defined in the printer.cfg file."
    echo "##########################################################################################################${reset}"
    echo

elif [ "$SPSVV" -gt 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The save_variables section is defined in the printer.cfg file more than once!!"
    echo "##########################################################################################################${reset}"
    echo
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# respond Checks
echo "${blue}Checking respond printer.cfg Section${reset}"
echo
if [ "$SPRESP" -eq 1 ]; then
    echo "${green}The respond section is defined in the printer.cfg file.${reset}"

elif [ "$SMNSL" -ge 1 ] || [ "$SMNSLB" -ge 1 ]; then
    echo "${green}The respond section is defined in the mainsail.cfg file.${reset}"
 
elif [ "$SMNSL" -eq 0 ] && [ "$SMNSLB" -eq 0 ] && [ "$SPRESP" -eq 0 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The respond section is NOT defined!"
    echo "##########################################################################################################${reset}"
    echo

elif [ "$SPRESP" -gt 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The respond section is defined in the printer.cfg file more than once!!"
    echo "##########################################################################################################${reset}"
    echo
fi

if [ "$SMNSL" -ge 1 ] || [ "$SMNSLB" -ge 1 ] && [ "$SPRESP" -ge 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: You have mainsail.cfg included but also the respond section defined in your printer.cfg file"
    echo "Please comment out the respond section inside your printer.cfg - we will use the mainsail.cfg one!"
    echo "##########################################################################################################${reset}"
    echo
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# force_move checks
echo "${blue}Checking force_move printer.cfg Section${reset}"
echo
if [ "$SPFM" -eq 1 ]; then
    echo "${green}The force_move section is defined in the printer.cfg file.${reset}"
    if [ "$SPFMT" -eq 1 ]; then
        echo "${green}The enable_force_move section is set True.${reset}"

    elif [ "$SPFMT" -eq 0 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: The enable_force_move section is either NOT set correctly or is missing!"
        echo "Make sure the setting is enable_force_move: True ...& does not read true with a small t"
        echo "##########################################################################################################${reset}"
        echo
    fi

elif [ "$SPFM" -eq 0 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The force_move section section is NOT defined in the printer.cfg file."
    echo "#########################################################################################################${reset}#"
    echo

elif [ "$SPFM" -gt 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The force_move section section is defined in the printer.cfg file more than once!!"
    echo "##########################################################################################################${reset}"
    echo
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# pause_resume Checks
echo "${blue}Checking pause_resume printer.cfg Section${reset}"
echo
if [ "$SPPR" -eq 1 ]; then
    echo "${green}The pause_resume section is defined in the printer.cfg file.${reset}"

elif [ "$SMNSL" -ge 1 ] || [ "$SMNSLB" -ge 1 ]; then
    echo "${green}The pause_resume section is defined in the mainsail.cfg file.${reset}"
 
elif [ "$SMNSL" -eq 0 ] && [ "$SMNSLB" -eq 0 ] && [ "$SPPR" -eq 0 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The pause_resume section is NOT defined!"
    echo "##########################################################################################################${reset}"
    echo

elif [ "$SPPR" -gt 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The pause_resume section is defined in the printer.cfg file more than once!!"
    echo "##########################################################################################################${reset}"
    echo
fi

if [ "$SMNSL" -ge 1 ] || [ "$SMNSLB" -ge 1 ] && [ "$SPPR" -ge 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: You have mainsail.cfg included but also the pause_resume section defined in your printer.cfg file"
    echo "Please comment out the pause_resume section inside your printer.cfg - we will use the mainsail.cfg one!"
    echo "##########################################################################################################${reset}"
    echo
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# max_extrude_cross_section Checks
echo "${blue}Checking max_extrude_cross_section printer.cfg Section${reset}"
echo
if [ "$SPXTRDR" -eq 0 ]; then
    echo "${blue}The extruder section is NOT defined in the printer.cfg file, check bypassed.${reset}"
    
else 
    if [ "$SPMXE" -eq 1 ]; then
        echo "${green}The max_extrude section is defined in the printer.cfg file.${reset}"

    elif [ "$SPMXE" -eq 0 ]; then
        echo
        echo "NOTE: This search is only within your printer.cfg file! It is expected to give a warning if you"
        echo "have a separate cfg file for your toolhead that contains your extruder section, pleasse manually check it!"
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: The max_extrude_cross_section is NOT defined in the printer.cfg file."
        echo "##########################################################################################################${reset}"
        echo

    elif [ "$SPMXE" -gt 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: The max_extrude is defined in the printer.cfg file more than once!!"
        echo "##########################################################################################################${reset}"
        echo
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# max_extrude_velocity Checks
echo "${blue}Checking max_extrude_velocity printer.cfg Section${reset}"
echo
if [ "$SPXTRDR" -eq 0 ]; then
    echo "${blue}The extruder section is NOT defined in the printer.cfg file, check bypassed.${reset}"
    
else    
    if [ "$SPMXEV" -eq 1 ]; then
    echo "${green}The max_extrude_velocity section is defined in the printer.cfg file.${reset}"

    elif [ "$SPMXEV" -eq 0 ]; then
        echo
        echo "NOTE: This search is only within your printer.cfg file! It is expected to give a warning if you" 
        echo "have a separate cfg file for your toolhead that contains your extruder section, pleasse manually check it!"
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: The max_extrude_velocity is NOT defined in the printer.cfg file."
        echo "##########################################################################################################${reset}"
        echo

    elif [ "$SPMXEV" -gt 1 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: The max_extrude_velocity is defined in the printer.cfg file more than once!!"
        echo "##########################################################################################################${reset}"
        echo
    fi
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# exclude_objects Checks
echo "${blue}Checking exclude_objects printer.cfg Section${reset}"
echo
if [ "$SPEXOB" -eq 1 ]; then
    echo "${green}The exclude_objects section is defined in the printer.cfg file.${reset}"
 
elif [ "$SPEXOB" -eq 0 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The exclude_objects section is NOT defined in the printer.cfg file."
    echo "##########################################################################################################${reset}"
    echo

elif [ "$SPEXOB" -gt 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The exclude_objects section is defined in the printer.cfg file more than once!!"
    echo "##########################################################################################################${reset}"
    echo
fi

echo "--------------------------------------------------------------------------------------------------------------"
echo

# moonraker.conf checks
echo "${blue}Checking file_manager moonraker.conf Section${reset}"
echo
if [ "$SPFMN" -eq 1 ]; then
    echo "${green}The file_manager section is defined in the moonraker.conf file.${reset}"
    if [ "$SPFMNT" -eq 1 ]; then
        echo "${green}The enable_object_processing section is set True.${reset}"

    elif [ "$SPFMNT" -eq 0 ]; then
        echo
        echo "${red}##########################################################################################################"
        echo "WARNING: The enable_object_processing is either NOT set correctly or is missing!"
        echo "Make sure the setting is enable_object_processing: True ...& does not read true with a small t"
        echo "##########################################################################################################${reset}"
        echo
    fi

elif [ "$SPFMN" -eq 0 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The file_manager section section is NOT defined in the moonraker.conf file."
    echo "##########################################################################################################${reset}"
    echo

elif [ "$SPFMN" -gt 1 ]; then
    echo
    echo "${red}##########################################################################################################"
    echo "WARNING: The file_manager section section is defined in the moonraker.conf file more than once!!"
    echo "##########################################################################################################${reset}"
    echo
fi

echo "--------------------------------------------------------------------------------------------------------------

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
END REPORT
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

${blue}Thank you for using this script & my macros.${reset}

System report generated $TIME"
echo
echo
