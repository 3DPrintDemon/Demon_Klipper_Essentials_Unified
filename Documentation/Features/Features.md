# See Update History for [latest features](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/Update%20History/Update_History.md)

# Previous & Existing Features

- NEW! ORCA Slicer `Multi_Surface` handling! 
- The printer knows what bed surface you choose to use & can add a pre-set Z offset for the print & remove it afterward! The system can even combine the surface offset with a filament or temperature based one! Don't worry though there are `Bed Saver` safety checks that should help stop you entering a wrong number & damaging your printer, especially when using the combine offset function!

- NEW! Random nozzle cleaning movements! 
- No more single path cleaning to wear out your brush/pad! All movements are randomly generated!

- NEW! Random filament purge parking! 
- No more purging in the same spot over & over piling filament on top of filament!

- NEW! Now includes the Demon Bed Fans Monitor!
- NEW! Now with Floating fan chamber control! The system will raise or low fan speed depending on temperature!
- Smart & fully adaptive Bed Fans control system!
- Full instructions available here in the `bed_fans.cfg` file

- NEW! The Demon AES System! 
- Save your printer from damage from homing errors when using a Z Endstop switch & Sensorless homing! This could save you a lot of money if homing fails!
- Full instructions available here: https://github.com/3DPrintDemon/Voron_2.4_AES_System_Auto_Emergency_Stop_For_Z_Endstop_Switch

- NEW! Start Macro handling for Smart Filament Sensor Encoder
- Disables the sensor until the macro completes

- NEW! Support for Klipper's `ADAPTIVE_MESH` system in the latest Klipper update
- NOTE you need the latest version of Klipper to use this!

- NEW! Adaptive Pressure Advance Mode! - APA - ORCA SLICER ONLY

- Why have only 1 single setting for Pressure Advance trying to work across the whole print when you can have 6!!

- 6 settings per filament, 30 in total!

- Each setting is automatically selected by filament for different types of extrusions during the print.

- Settings for Perimeter, External Perimeter, Internal Infill, Solid Infill, Top Solid Infill, & filament default.

- Print tuning towers for the speed of each extrusion type & apply them to the Adaptive Pressure Advance (APA) modifiers!

- Disable or enable individual modifiers, you don't have use them all, use any number in any combination!

- Or disable modifiers by filament or the whole module at once!

- All settings in one easy to edit place, no need to edit macro code!

- Verbose mode, read back all APA commands to the console!

***These macros rely on you setting the correct filament type in your slicer! BE SURE YOU DO THIS!***

**Mesh Auto Builder!**

- Auto build all 5 meshes at different temperatures with included heat soak waits & message prompts! Inspired by a community contribution from Karl L! Thank you for sharing!


**Demon Print Start End**

- The printer knows what filament you sliced your print for!

- You can now choose 2 different flow rates for each filament that are automatically selected depending on if you're using a small layer height for fine detail prints, or a large layer height to get stuff done quick for that filament! - LOVE THIS! 

- Pressure Advance & Smooth Time values for each filament, each can will be applied automatically, if the filament type is unrecognised the default stored value is used.

- Pre print filament runout check 

- Fast & adaptive Nozzle Preheat, values for each of the 5 filament presets. If the filament you're using is not on the list then the macro falls back on reading the file temps & makes a decision from there.

- Fully conditional homing, don't home again if you don't have to!

- If you have a chamber or printer enclosure with a temperature sensor the macro can be set to use it for heat soaking the printer.

- If you have a chamber or printer enclosure with a cooling fan then there are settings for when the fan comes on for each filament to help maintain the correct temperature!

- Store 5 Meshes, one for each filament type. Each will be called automatically for the correct filament! Then if the filament type is not recognised the macro will fall back on reading the file temps & makes a decision from there.

- Automatically applied high temperature expansion offset for ASA & ABS filaments with a bed-saver safeguard! You set the offset to use. This will only allow small adjustments so can't dig trenches into your bed! Range of -0.1mm to +0.1mm is available. Anything outside this range causes an Emergency Stop! Offset adjustment feature can be switched on/off. USE WITH CARE!

- PETG Anti-Squish with bed-saver safeguard! This allows a positive Z offset to all PETG prints automatically to reduce the first layer squish. Range 0.00 to +0.1mm. Anything outside this range causes an Emergency Stop! Offset adjustment feature can be switched on/off. USE WITH CARE!

- Filaments have Heat Soak timers that are now controlled by either enclosure temp sensor readings, or timers. You choose! Timers are default if you don't have an enclosure or sensor.

- Support for Quad Gantry Level on CoreXy machines & for 5 stepper driver bed slinger systems with Z-Tilt option

- Customise your purge line! Choose where to start & which axis to purge along! X or Y! 



**Demon User Settings**

- This file contains all the 'Variables' available for the Demon Print Start End Macro, open & edit one single file! No need to trawl through the macros!

- You can even turn on/off hardware options as your system changes & grows over time! Don't worry about future-proofing, its already built right in!



**Included User executable macros:**

- `PRINT_START`
- `PRINT_END`
- `_RET_CALI_START`
- `_GOODNIGHT`
- `Gantry_Level_Hot`
- `Gantry_Level_Cold`
- `CLEAN_NOZZLE`
- `LOAD_CLEAN`
- `UNLOAD_CLEAN`
- `Pressure_Advance_Test_Mode`
- `Auto_Bed_Mesh_Builder`
- `Stepper_Buzz_Cycle`
- `PID_Tune_Mode_FULL`
- `Auto_Shaper_Calibrate`
- `Resonance_Test_X`
- `Resonance_Test_Y`
- `System Sensors`
- `Printer_Status`
- `Z_Switch_Calibrate_Hot`
- `Z_Probe_Calibrate_Hot`
- `Z_Probe_Accuracy_Hot`
- `Z_Switch_Calibrate_Cold`
- `Z_Probe_Calibrate_Cold`
- `Z_Probe_Accuracy_Cold`
- `Present_Toolhead`
- `Return_Toolhead`
- `Timer_Start`
- `Timer_Stop`
- `Power_Down`
- `Backup_Printer`
- `Bed_Fans_Speed`

- Plus many more automated ones!

