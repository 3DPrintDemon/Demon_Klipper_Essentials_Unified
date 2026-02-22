# Modify Your SV08 Max's Chamber Heater For Temperature PID Control

You can easily modify your Sovol chamber heater for temperature PID control by adding another thermistor & replacing Sovol's chamber_hot.cfg file.

>[!CAUTION]
>Modifying this unit is DANGEROUS! It deals with MAINS LEVEL VOLTAGES! These can KILL YOU & set fire to stuff & burn your house down!
>
>DO NOT ATTEMPT THIS IF YOU HAVE ANY DOUBT IN YOUR KNOWLEDGE OR COMPETENCY!
>
>BY USING THESE FILES & ANY ASSOCIATED INFORMATION HEREIN YOU AGREE TO ACCEPT FULL RESPONSIBLY & LIABILITY FOR ANY & ALL RESULTING OUTCOMES OF THEIR USE. USE AT YOUR OWN RISK!
>
>All outcomes good or bad through the use of this information or any of my macros or files is totally 100% on you! I accept no responsibility or liability in whole or in part for any loss/damage/injury/death to you or anyone else linked directly or indirectly through the use of any files I have published or any information supplied here or elsewhere in my published works.
>
>I provide no guarantee or promise that any information presented here is in any way accurate, safe or correct. Use it at your own risk.


<br>

# Do I Need To Do This? What Does It Do...?

This is 100% optional!

This modification allows Klipper to monitor & control your chamber heater with it's PID system, it will also be able to Emergency Stop the printer if the chamber heater gets too hot or if it's not heating as expected! This is vitally important & adds a layer of safety to the device that has been omitted out of the box! The air coming out of the heater can reach 95ºc or more!! 

DKEU will now be able to actively modify the temperature of the chamber heater while printing, allowing the system to automatically increase or decrease the temperature, or even turn the heater off completely if the chamber temperature is too high & then powering it back on when it gets back in range.

Plus it gives you a Gcode button switch in Mainsail that allows you to manually override the automated systems & disable the chamber heater until you choose to turn it back on during that print. 

The heater is automatically disabled for low temperature printing.

<br>

# BOM

You will need:
1. NTC 3950 100k glass bead thermistor
2. JST 1.25mm two pin plug
3. 6mm Heat resistant Kapton Tape (up to 260ºc)
4. 50-70mm length of 2-3mm good quality heat shrink tube
5. RTV Silicone
6. Small cable tie
7. Drill & 3-4mm drill bit

<br>

# Adding The New Thermistor

Remove the chamber heater from the printer. Open the unit by removing the 6 bolts on the rear.

Add the  EPCOS 100K B57560G104F glass bead thermistor with the JST 1.25mm two pin plug to the MCU board inside next to the cable that'll say `TEMP 1`.

![IMG_1673](https://github.com/user-attachments/assets/2a3ad818-544b-4a83-a9df-82bee19c5d84)
![IMG_1656](https://github.com/user-attachments/assets/bd65f37b-7a1d-4e49-a1f8-2c7b3ff0032a)

<br>

## Protecting The Thermistor Wires

Slide the 50-70mm length of 2-3mm good quality heat shrink tube over the thermistor wires making sure to leave the glass bead exposed! Use gentle heat to shrink the tubing. Note, using a naked flame to do this could very well damage your thermistor!!
Now take the Kapton tape & wrap a tight spiral from just behind the glass bead all the way back down the heat shrink tubing so everything is protected.

Lay the thermistor out so it sits over the middle of the heater & NOT at edges & NOT over a solid plate. It needs to be over the fins so airflow from the fan can heat it.

Take a 50mm length of Kapton tape & secure the thermistor wire to the small plastic tab that sticks out over the silver heater element.

>[!TIP]
>This is easier if the heater element is released & moved to one side first from the heater casing!

<br>

## The Correct Position

It should look like this when you're finished....

![IMG_1675](https://github.com/user-attachments/assets/f64224bf-7098-4aec-a0f2-578a13563fcc)



<br>

## The INCORRECT Position!

If it looks like this it is wrong & will not work well enough as its too enclosed by the poorly placed & designed stock mount & is too far out of the airflow from the heater's fan!

>[!CAUTION]
>This is wrong & WILL NOT WORK if placed like this!



![IMG_1660](https://github.com/user-attachments/assets/fa63395a-c431-4f2a-b8f9-7019da28c254)


<br>

## Securing The Wires Safely

Drill a small 3mm hole in the plastic next to the thermistor mount. Secure the wires with the small cable tie next to heater, making sure that the wires are kept well clear of it!

![IMG_1674](https://github.com/user-attachments/assets/82f40b25-d586-4157-825d-66249327f61a)

<br>

Next add a large blob of RTV Silicone to the loose end of the thermistor just behind the glass bead to keep it in the correct position over the heater element.

![IMG_1677](https://github.com/user-attachments/assets/a35d7c25-43d5-4165-b7e5-8f3291958380)


<br>

## Reassemble

Reassemble the heater & reattach to the printer. Again it needs to look like this with the tip of the thermistor here...

![IMG_1679](https://github.com/user-attachments/assets/95739d62-7cd1-40f5-89dd-dcc52a7e2c5f)

 
>[!CAUTION]
>DO NOT push the thermistor into the fins of the heater element! JUST NO, DONT DO IT! It must be free of the metal behind it & have no chance of making contact! It MUST remain in free air in front of the heater!


<br>

# Orca Changes

First go to Orca & open your filament settings & uncheck the `Activate Temperature Control` box, you wont need it as Klipper & DKEU will now automatically monitor & control your chamber heater.

<img width="361" height="103" alt="Orca CH" src="https://github.com/user-attachments/assets/60b9d9c2-3d1c-4742-a6ff-7b5f40604e6f" />

Be sure to save & edit any other profiles you have.

<br>

# New chamber_hot.cfg File

Now download & install the new chamber_hot.cfg file

SHH into your printer & send...

```
cd ~/printer_data/config
wget https://raw.githubusercontent.com/3DPrintDemon/DEMON-SV08MAX/refs/heads/main/DEMON_SV08_MAX_REPLACEMENT_FILES/chamber_hot.cfg --backups=1
```

<br>

# Printer.cfg Changes

Comment out the fan mounted on the chamber heater.

Stock file:

<img width="364" height="87" alt="Stock" src="https://github.com/user-attachments/assets/a7cabc81-6339-407e-bcf1-7a0e751c360c" />

Place # at the start of each line

<br>

Previously modified DKEU file:

<img width="266" height="111" alt="DKEU File" src="https://github.com/user-attachments/assets/1ee4b982-2a3f-4b2d-8b5e-c73467151931" />

Place # at the start of each line

<br>


# Demon User Settings File Changes

To use the heater with DKEU you'll need to change a couple of settings in the `demon_user_settings` cfg file.

Edit line `variable_danger_will_robinson` to read `True`

<br>

<img width="429" height="187" alt="Danger Will Robinson" src="https://github.com/user-attachments/assets/1013f0b8-62fd-45f7-87b1-89e7951b4bb7" />


This is important as it'll unlock the system ready for use.


<br>

Next edit line `variable_chamber_heater` to read `True`

<img width="429" height="414" alt="Chamber Heater On" src="https://github.com/user-attachments/assets/85a67b2b-c9f8-40c1-9d4b-23899c35b4bc" />


This will tell DKEU you have a chamber heater & want to use it.

<br>

Now Save & Restart Klipper

<br>

# [BACK TO WHERE YOU WERE...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_EXTRA_INSTRUCTIONS.md#use-your-sv08-max-without-the-sovol-filament-bufferfeeder)

