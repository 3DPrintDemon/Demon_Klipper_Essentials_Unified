# SV08 MAX EXTENDED PINS - NOT PUBLISHED BY SOVOL!

Here you can find a selection of extra pins on the stock SV08 MAX mainboard for expanding your system!

- 1x disable/enable clog detection switch
- 2x thermistor pins, great for chamber & case sensors!
- 3x digital output pins, gcode buttons or I/O sensor pins @3.3v
- 2x chains of multicolour neopixel LED chains!

****************************************************************************************************************************

<br>

# Add Clog Detection Override Pin!

>[!IMPORTANT]
>In the `buffer_stepper.cfg` file you are [about to install](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_EXTRA_INSTRUCTIONS.md#ok-now-the-tricky-ssh-bit) you will need to add the pin shown a few lines down to use as a manual override for the clog detection.
This will allow you to disable the automated clog detection during a print if you keep getting false triggers!

See line 40 of the `buffer_stepper.cfg` file, under the `[output_pin STOP_CLOG_DETECTION]` & add this pin...

```
pin: PC12
```

****************************************************************************************************************************

<img width="698" height="607" alt="MS1" src="https://github.com/user-attachments/assets/290944cf-d74e-47e7-b534-33bacd7ff5cd" />
<img width="561" height="811" alt="MS2" src="https://github.com/user-attachments/assets/2a7d5c88-bc12-4b73-8ae9-ebdd8767a0fb" />

****************************************************************************************************************************

<br>

# Add digital output pins, gcode buttons or I/O sensor pins @3.3v

These can be setup as any of the above this is just an example:

```
[output_pin OUTPUT_PIN1] # Door Detect
pin: PB2

[output_pin OUTPUT_PIN2] # PLA Detect
pin: PE7

[output_pin OUTPUT_PIN3] # PLA Twine Detect
pin: PE8
```

<img width="600" alt="Max Pins 1" src="https://github.com/user-attachments/assets/801f3d71-f2ce-409a-aa6f-a64fda2a697e" />

****************************************************************************************************************************

<br>

# Add 2x Neopixel chains

```
[neopixel NEO_LEDs1] # RGB1
pin: PD14
chain_count: 3
color_order: GRB
#   Set the pixel order required by the LED hardware. Options are GRB,
#   RGB, GRBW, or RGBW. The default is GRB.
initial_RED: 1.0
initial_GREEN: 0.0
initial_BLUE: 1.0
initial_WHITE: 0.0

[neopixel NEO_LEDs2] # RGB2
pin: PB11
chain_count: 3
color_order: GRB
#   Set the pixel order required by the LED hardware. Options are GRB,
#   RGB, GRBW, or RGBW. The default is GRB.
initial_RED: 1.0
initial_GREEN: 0.0
initial_BLUE: 1.0
initial_WHITE: 0.0
```

<img width="600" alt="Max Pins 2" src="https://github.com/user-attachments/assets/f29a219f-5c86-42f8-8a07-443a7bb9fb14" />

****************************************************************************************************************************

<br>

# Add 2x ADC Thermistors

>[!IMPORTANT]
>be sure to set your correct sensor type!

```
[temperature_fan chamber] # T Box1
pin: PE11
max_power: 1.0
shutdown_speed: 0.0
kick_start_time: 0.5
cycle_time:0.01
off_below:0.1
sensor_type: ATC Semitec 104GT-2 #Generic 3950 #EPCOS 100K B57560G104F
sensor_pin: PA1
min_temp: 5
max_temp: 70
target_temp: 50
control: watermark
gcode_id: CHF

## OR...

# [temperature_sensor Chamber_Temp] # T Box1
# sensor_type: ATC Semitec 104GT-2
# sensor_pin: PA1
# pullup_resistor: 4700
# inline_resistor: 0
# min_temp: 5
# max_temp: 70
# gcode_id: CHT

[temperature_sensor Case_Temp] # T Box2
sensor_type: Generic 3950
sensor_pin:PC4
pullup_resistor: 4700
inline_resistor: 0
min_temp: 5
max_temp: 70
gcode_id: CST
```
<img width="600" alt="Max Pins 3" src="https://github.com/user-attachments/assets/cb334951-392d-42ee-a30c-800ff1781e56" />

****************************************************************************************************************************

<br>

## Back to [SV08 MAX Extra Instructions Page](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_EXTRA_INSTRUCTIONS.md)
