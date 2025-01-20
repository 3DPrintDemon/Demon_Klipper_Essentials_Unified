# Voron 2.4 AES System - Auto Emergency Stop For Z Endstop Switch
Save your printer with this Auto E STOP System to catch Z Homing errors using a nozzle triggered endstop switch.

You're probably thinking you don't need this & that your printer always works & it'll be fine. 

Yeah thats true until it isn't! All it takes is a single homing error or failure to totally ruin your print surface when your nozzle ploughs into it & then gets dragged round it when you start a print!

A friend of mine just had his $70 350x350 bed totally trashed by this exact thing, for some reason his nozzle hit the endstop off-centre & the Z offset was about 3mm wrong, as you can imagine there were some bad noises & lots of broken things!

So I came up with this idea! Basically consider it an insurance policy for your printer. Think of it like a smoke detector for your house, or seat belt in your car - it’s better to have them & not need them than it is to need them & not have them, & that one day when you do need them they could well save everything!

The system uses an inductive probe to trigger an automatic `Emergency Stop` when it senses the gantry is too low for the correct Z triggering point when Homing Z. 

The system lays ready but disarmed during normal operation & printing, then becomes armed as soon as `Home Z` is called, & it will trigger if your nozzle misses the Z endstop switch & the gantry lowers past its normal Z triggering point. It disarms itself once Z homing is complete.

# REQUIRED PARTS

- LDO M8 Pinda 2 Inductive Probe (NC version used here)
- Rpi Relay hat or single relay board, or build a transistor power controller - https://adam-meyer.com/arduino/TIP120
- x1 M4 8mm Cap head bolt
- x1 M4 T-nut
- THREADLOCK!!


# STL FILE...

Head over to printables to grab the STL: https://www.printables.com/model/722483-voron-24-aes-system-sensor-mount

# INSTALL

Why not go big!? Install the full macro pack found here! It works on most Klipper CoreXY & bed slinger printers! This system is included there!

https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified

- Install the `AES System Sensor Mount` onto the rear left corner of your printer's 20x20 extrusion, with about 10-15mm clearance from your B motor when the nozzle is on the bed. USE THREADLOCK!
- Now add the Probe to your sensor mount, set the tip of the probe so its 1mm from the housing of the B motor. USE THREADLOCK!
- Install your choice of power relay or transistor control.
- Connect the wires to your board & define the correct pin.
- My probe's wiring was as follows. Yours may differ. Brown=+, Blue=-, Black=Signal, White=Temp.
- We don't need temp & it's not good for accurate readings anyway so cut that back & insulate.


# CONFIGURING THE SYSTEM

Be sure you have set your Klipper instance to be able to use your Host's GPIO pins via a Linux Process secondary MCU. To do this follow this link.
https://www.klipper3d.org/RPi_microcontroller.html?h=gpio#install-the-rc-script



Now you need to edit the `Klicky-Macros.cfg` file. Don't worry it's super simple edits. This file is located in your printer's `config` folder inside the `Klicky` folder.
Open the file & CTRL+F & search:
```
[gcode_macro _Home_Z_]
```
Then on empty `Line Number 867` add this code:
```
SET_GCODE_VARIABLE MACRO=_AES_SYS VARIABLE=e_stop_armed VALUE=False # AES SYSTEM
_AES_READ # AES SYSTEM
```
Now on empty `Line Number 839` add this code:
```
SET_GCODE_VARIABLE MACRO=_AES_SYS VARIABLE=e_stop_armed VALUE=True # AES SYSTEM
_AES_READ # AES SYSTEM
```

Then DOUBLE CHECK YOUR WORK! 

All good? Ok `Save & Exit`

If you have a `Macros.cfg` add the following macros there. If you don't have a `Macros.cfg` I recommend you make one. If you're using my `Demon_Klipper_Essentials_Unified` macro pack you do not need to add the 2 macros below (_AES_SYS & _AES_READ) as they're already included within this macro pack. You will still need to add the `EAS SYSTEM CONTROL` as well as the `Output pin` sections.

```
[gcode_macro _AES_SYS]
variable_e_stop_armed: False
gcode:

[gcode_macro _AES_READ]
gcode:
 {% set aes_vars = printer["gcode_macro _AES_SYS"] %}
   
     {% if aes_vars.e_stop_armed == True %}
       RESPOND TYPE=COMMAND MSG="Homing Z AES System ARMED"
       SET_PIN PIN=AES_SYSTEM_ENABLE_-_KLIPPER_CONTROLLED VALUE=1.0
     {% else %}
       RESPOND TYPE=COMMAND MSG="AES System DISAMRED"
       SET_PIN PIN=AES_SYSTEM_ENABLE_-_KLIPPER_CONTROLLED VALUE=0.0
     {% endif %}
```

Now head over to your `Printer.cfg` file & add:
```
########################################
#   AES SYSTEM CONTROL
########################################
# Get Button Status with: QUERY_BUTTON button=AES_System_Sensor
# Will return PRESSED or RELEASED

[gcode_button AES_System_Sensor]
pin: ****
press_gcode:
 {% set aes_vars = printer["gcode_macro _AES_SYS"] %}
   # RESPOND TYPE=COMMAND MSG="AES System TRIGGERED"
 {% if aes_vars.e_stop_armed == True %}
   {action_emergency_stop("AES System TRIGGERED!")}
 {% endif %}

# release_gcode:
   # RESPOND TYPE=COMMAND MSG="AES System READY" 
```

You will obviously need to add your own pin you're using here & possibly a `!` between the `^` & your pin number, (so e.g `^!###`) if you have a `NO Probe` (Normally Open Probe) & not a `NC Probe` (Normally Closed Probe). 

NOTE: If you have an `NO Probe` you may also need to swap the lines of code under `press_gcode:` & `release_gcode:` for correct operation! IMPORTANT!!

You'll need this to allow Klipper to control the relay & turn power to the probe on & off automatically.
Example given is a good option for a Raspberry Pi4b using a Wavshare 3 relay hat, you may or may not need the "!" for correct operaation of your relay.
BE SURE TO CHOOSE THE CORRECT GPIO PIN FOR YOUR SYSTEM!
```
########################################
#    Output Pin
########################################
[output_pin AES_SYSTEM_ENABLE_-_KLIPPER_CONTROLLED]
pin: !host:gpio21
```


# SETTING UP THE PRINTER

Now we need to wire up the probe's power to the relay or transistor. Hook the probe's signal & ground connections up normally to your mainboard but divert the v+ line to pass through your relay using the relay's NO (Normally Open) position so it can be turned on & off via the above output pin on your host. This means you will be able to totally disable the probe from triggering when not in use & it will not flood your MCU with switch triggers while printing. VERY IMPORTANT!

After adding the required lines to your .cfg files & the probe's power control device of your choice you'll need to spend some time setting the height & distance of the probe so it activates between the Z endstop switch's activation point & the nozzle touching the bed surface `Z0`.
This can be a bit tricky & can take a bit of time. The more accurate you are the better this system will work! It will be ONLY AS GOOD AS YOU SET IT UP!

You'll need to home the printer then move the nozzle down to `Z5.0` then slowly lower it until you find the probe's triggering point & check to see if its between the two points mentioned above, if not move the probe until you get the correct position. THIS IS VITALLY IMPORTANT TO GET CORRECT!

To test the probe you must be sure the `AES_SYSTEM_ENABLE_-_KLIPPER_CONTROLLED` is in the `ON` position in your mainsail interface! If not the whole system will not work as it will have no power!

To check the probe activation point you can use:
```
QUERY_BUTTON button=AES_System_Sensor
```

Once it changes from `RELEASED` to `PUSHED` you're there!

Or.....

If you want an automatic notification uncomment the two `RESPOND` lines in `[gcode_button AES_System_Sensor]` / `press_gcode` & `release_gcode`

Just remember to comment them out again when you're finished as they're just for testing & setup.

Once complete you can real-world test the system in two ways. The first is to raise up Z to at least `Z150` for example & hit `Home_Z`, once the printer is coming back down touch a metal object to your new sensor. This should activate the AES System & stop your printer.

The second way is to `Home_All` & then move the nozzle to `Z5.0`. Now send:
```
_AES_READ
```
It should come back saying `AES System DISARMED`. Then send:
```
SET_GCODE_VARIABLE MACRO=_AES_SYS VARIABLE=e_stop_armed VALUE=True
```
Then `_AES_READ` once again to confirm the state change.

Now slowly lower the nozzle to the bed, the AES system should trigger the `Emergency_Stop` once you reach your set point.

If it does not repeat with the nozzle off the edge of the bed to find the activation point (BE CAREFUL!!), or touch the probe tip with the metal object again if the activation point cannot be found.
If activation point is too high or low - move probe height to correct.
If probe doesn’t activate with the motor casing but does with a metal object move probe closer to the motor casing.

