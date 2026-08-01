# :tada: MAINLINE YOUR MAX! :tada:

Use the Sovol image but convert it to mainline Klipper! NO STLINK REQUIRED!

<br>

# :gift: SUPPORT YOUR FRIENDLY 3DPrintDemon! :gift:

>[!TIP]
>Please consider supporting this project…. Even if it’s for a single donation!
>
>It really does make a difference & any amount you send is greatly appreciated!

This macro pack is the cumulation of 3 years of work by one person alone, there have been countless late nights, missed family time, bottomless cups of coffee, as well as a boat load of effort & dedication. There’s been endless weeks of writing code & then probably that amount of time again at least thoroughly testing the files so that you can rest assured that they work & these macros will NOT damage or harm your printer in any way! Not counting any improper setup of course…

Plus I provide the DEMON DISCORD to help anyone with getting DKEU working on their system!

All of this is given away to the community for FREE.

However I would like to kindly ask that if you gain any sort of benefit, joy, improved quality of life using your printer, or maybe if you use these macros as part of your side or regular business, for example in your print farm or to help make your craft fair items please consider making a pledge on the 3DPrintDemon Patreon page for however much you feel these macros are worth to your printing life & your business income! You can choose the amount of your donation & how long you are an active donating supporter!

You can stay a supporter on the 3DPrintDemon Patreon sending donations of your choosing for as long as you like. Maybe it’s for just a month or two for single private users that would like to show your gratitude, or maybe you could consider ongoing support if you’re a business owner & make regular use of my work to aid your business.

Active supporters have a special channel on the Demon Discord server & are provided with a higher level of support over non supporting members. Just make your discord user name known & you’ll be granted “supporter” privileges.

:red_circle: [JOIN THE 3DPRINTDEMON PATREON](https://patreon.com/3dprintdemon) as an active donating member & show your support for my work!

Your donations are used to feed my printers & give them the latest fancy pants new parts so I can continue adding new features, fixing bugs & providing time for helping you all to get the macros running & fixing issues you might experience!

Be sure to use the website not the IOS app, it's cheaper!

<br>
<br>

# :red_circle: :warning: WARNING! WITH ANY VERSION OF THE LATEST KLIPPER YOU WILL LOOSE THE ABILITY TO RUN THE BUFFER_STEPPER!!!!

# :red_circle: :warning: YES YOU READ CORRECTLY BY DOING THIS YOU WILL LOOSE YOUR AUX FEEDER!!! STOP NOW IF YOU DON'T WANT THAT!

This is due to fundamental changes in recent releases of Klipper that render the Sovol code incompatible!

Note you will also loose the Sovol PLR function. Just so you know.

## :red_circle: :warning: EXTRA WARNING! There are risks by doing this, they are small but you need to be careful as you're editing Klipper, building firmware files & flashing the MCU's! Be sure you have an ST Link handy incase something does go wrong! PROCEED AT YOUR OWN RISK!

<br>

### 🆘🛟 [NEED HELP - CLICK HERE](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/Mainline_Your_SV08_MAX.md#red_circle-ok-i-gone-done--messed-up-i-borked-my-board-help) 🛟🆘

The flash didnt work or you set wrong pins &/or you managed to overwrite your bootloader!

<br>
<br>

## :warning: START BY MAKING A BACKUP!

Make a backup of your current system now! Be sure you at least download your current `/config` folder BEFORE YOU DO ANYTHING ELSE!! You want have a set of UNTOUCHED files to refer back to if needed! Once a backup is saved on your computer you can use it to drop files back into this fresh install once you finish the guide! Also be sure to use a new SD card or SSD - this will leave your old system safe & completely untouched!

Best backup is a clone of your EMMC that you can simply swap back to or flash another copy of incase you need it. 

<br>


OPTIONAL - To be extra safe you could scan all your MCU's & download all stock firmware using the STM32Cube Programmer tool via an ST Link USB Dongle before you attempt this change.

Get the tool [here!](https://www.st.com/en/development-tools/stm32cubeprog.html)

<br>

<br>

# :red_circle: FOLLOW THIS GUIDE FIRST

Make sure you do it ALL! Then come back here.

### [HOW TO FIX & UPDATE STOCK SOVOL EMMC IMAGES - CLICK HERE!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/Fix_Sovol_EMMC_Images/FIX_SOVOL_EMMC_IMAGES.md)

<br>

# :red_circle: PREPARATION

SSH command...

Install Katapult, while the MCU bootloaders have it the host does not, so you need it install it to make use of it.
```
git clone https://github.com/Arksine/katapult
```

Then Update Kiauh 

```
cd kiauh
```
```
git config pull.ff only
```
```
git pull
```
then stop the Klipper service

```
sudo service klipper stop
```

Now start Kiauh

```
~/kiauh/kiauh.sh
```

The hit option `S` & check the first section for reads Klipper source repository reads 

`Repo: github.com/Klipper3d/klipper`

`Branch: master`

Now back to the main menu `B`

<br>

# :red_circle: DELETIONS

Press `3` to `Remove` software!

Here we want to COMPLETELY remove Sovol Klipper!

Press `1` to remove `Klipper`

<br>

# :red_circle: INSTALL NEW

Now back to the main menu `B`

Go to `1 Install`

the select `1 Klipper` & install new mainline Klipper!

Now back to the main menu `B`

<br>

:red_circle: Install the Kiauh Extras

- Option `4 Advanced`
- Option `5 Input Shaper` - Do you want to install the required packages? YES

<br>

5. Back to main menu `B`

- Option `E Extensions`
- Option `1 G-Code Shell Command`
- Option `1 Install` - Create an example shell command? NO!

Now back to the main menu `B`

hit `Q` to exit &...

```
sudo reboot now
```

<br>


# :red_circle: BIG RED ERROR TIME!

We should now have a new mainline install of Klipper & it'll probably be giving you a big red error screen & some Moonraker warnings about depreciated MCU firmware. Don't worry this is totally normal & expected!

Its just telling you your current MCU firmware is out of date! We're gonna fix that in a minute!


<br>

# :red_circle: FLASHING NEW MCU FIRMWARE!

>[!IMPORTANT]
>The SV08 Max comes with KATAPULT already installed on ALL MCU's!! So all we need do is issue the jump command & update the firmware!

<br>

>[!WARNING]
>The MCU UUID's will change after the flash so be sure to use the command to search for them! See below!

Scan for UNASSIGNED Canbus UUID's - this will NOT show any assigned nodes!

<br>

```
~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0
```
<br>

Head over to here for updating your mainboard mcu
https://canbus.esoterical.online/mainboard_klipper_updating.html

#### SETTINGS FOR THE SOVOL SV08 MAX MAINBOARD:

>[!NOTE]
>OPTIONAL GPIO PIN SETTINGS: The two pins starting with exclamation marks (highlighted blue in below image) will stop the two giant rear fans blasting full power whenever you turn the printer on, but do note if the chamber heater is very hot it will also stop any hard shutdown state from cooling it while Klipper starts. Add them or not to your config, the choice is yours.

<img width="615" alt="MAX MAIN MCU" src="https://github.com/user-attachments/assets/c0ace630-1174-4255-aaa3-4c040fde753b" />


<br>
<br>
<br>



Now head to here to update the toolhead & chamber heater!
https://canbus.esoterical.online/toolhead_klipper_updating.html

#### SETTINGS FOR THE SV08 MAX EXTRA MCU & HOT MCU (toolhead & chamber heater!):

<img width="615" height="235" alt="MAX OTHER MCUS" src="https://github.com/user-attachments/assets/78ff3213-0774-4c6d-9c85-aa8d91cdef77" />

<br>
<br>
<br>


# :red_circle: BUILD HOST MCU FIRMWARE

```
cd ~/klipper/
sudo cp ./scripts/klipper-mcu.service /etc/systemd/system/
sudo systemctl enable klipper-mcu.service
```

```
make menuconfig
```

Set to compile firmware for `Linux process` found under Micro-controller Architecture options.

Then...

```
sudo service klipper stop
make flash
sudo service klipper start
```

<br>

# :red_circle: PRINTER CFG CHANGES

### Comment Out:

Commenting out these Sovol sections shown here.

```
# [probe_eddy_current eddy]
# sensor_type: ldc1612
# z_offset: 3.50
# i2c_mcu: extra_mcu
# i2c_bus: i2c2
# x_offset: -19.8
# y_offset: -0.75
# # vir_contact_speed: 3.0
```
```
# [z_offset_calibration]
# non_contact_probe:probe_eddy_current eddy
# contact_probe:probe_eddy_current eddy
# endstop_xy_position: 250,251
# center_xy_position: -10,10                        
# z_hop: 5                       
# z_hop_speed: 10
# internal_endstop_offset: -0.25 
```

<br>

### Paste In:

Now add this expanded section below to your printer.cfg

```
[probe_eddy_current eddy]
sensor_type: ldc1612
max_sensor_hz: 6031173
descend_z: 3.50
i2c_mcu: extra_mcu
i2c_software_scl_pin: extra_mcu:PB10
i2c_software_sda_pin: extra_mcu:PB11
x_offset: -19.8
y_offset: -0.75

speed: 5
# samples: 3              #<<<< Uncomment to increase probed samples
# samples_result: median  #<<<< Uncomment to use middle value sample
sample_retract_dist: 5.0
samples_tolerance: 0.0095
samples_tolerance_retries: 10

# tap_threshold:          #<<<< Uncomment to add custom tap threshold value
# tap_z_offset: 0.0       #<<<< Uncomment to adjust tap_z offset if needed

```

Save & Restart

<br>

# :red_circle: BEFORE USE!

Before you start using your new system be sure to disable this macro in the DKEU custom_exapansion file! It is no longer required.

## :red_circle: [CLICK HERE - DISBALE THIS MACRO CALL!!](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_EXTRA_INSTRUCTIONS.md#sv08-max-custom-expansion-file---required)

<br>

# :red_circle: CONFIGURE EDDY!

Follow the configuration steps here to correctly setup your probe.

Full document link: https://github.com/Klipper3d/klipper/blob/master/docs/Eddy_Probe.md

This file is basically a bit of a deep dive, so start from [this section here](https://github.com/Klipper3d/klipper/blob/master/docs/Eddy_Probe.md#configuration)

Even shorter shortcuts & links for those that need this info fast...

<br>

>[!CAUTION]
>The SET_KINEMATIC_POSITION command below tells your printer that the Z axis is at Z25. It doesn't know any different & will blindly think that this is correct simply because YOU TOLD IT that is was!
>
>YOU CAN DAMAGE YOUR PRINTER HERE - BE VERY CAREFUL!!!

<br>

- Set your probe to the correct height. Home X & Y
  
  ```
  G28 X Y
  ```
  
  Now send....

  ```
  SET_KINEMATIC_POSITION Z=25
  ```

  Now SLOWLY lower your nozzle until it is 20mm off the bed's build surface! BE VERY CAREFUL!!

  DO NOT simply enter Z20 into mainsail & expect it to go to Z20 - IT WILL NOT BE CORRECT!

  Use a ruler or an object of known size as reference. If you need to move down more repeat the above SET_KINEMATIC_POSITION command & continue to lower.

  So you are completely safe disable all steppers, send...

  ```
  M84
  ```
  
- [Calibrate your drive current](https://github.com/Klipper3d/klipper/blob/master/docs/Eddy_Probe.md#calibrating-drive-current)

  Read link above or just use this DKEU macro by sending...

  ```
  EDDY_CURRENT_CALIBRATION
  ```
  
- [Then Calibrate your Z heights](https://github.com/Klipper3d/klipper/blob/master/docs/Eddy_Probe.md#calibrating-z-heights)

  Read link above or just use this DKEU macro by sending...

  ```
  EDDY_HEIGHT_SETUP
  ```
  
- [Lastly calibrate your tap system](https://github.com/Klipper3d/klipper/blob/master/docs/Eddy_Probe.md#tap-calibration)

  This one I'm afriad you gotta read!

<br>

# :red_circle: FINISH!

You should now be on Mainline Klipper!

Image below: My SV08 Max converted to mainline with above outlined process with all MCU's updated running & the latest commit of Klipper at the time of writing.

<img width="839" height="467" alt="DONE!" src="https://github.com/user-attachments/assets/97440e60-9aae-48f9-8906-53c40fc67309" />

<br>
<br>
<br>
<br>

## :red_circle: [Back the SV08 MAX instructions page...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/SOVOL_SV08_MAX_SETUP/SV08_MAX_EXTRA_INSTRUCTIONS.md#if-youre-using-a-sovol-sv08-max-printer)

<br>
<br>

# :gift: SUPPORT 3DPrintDemon! :gift:

You can stay a supporter on the 3DPrintDemon Patreon sending donations of your choosing for as long as you like. Maybe it’s for just a month or two for single private users that would like to show your gratitude, or maybe you could consider ongoing support if you’re a business owner & make regular use of my work to aid your business.

Active supporters have a special channel on the Demon Discord server & are provided with a higher level of support over non supporting members. Just make your discord user name known & you’ll be granted “supporter” privileges.

:red_circle: [JOIN THE 3DPRINTDEMON PATREON](https://patreon.com/3dprintdemon) as an active donating member & show your support for my work!

****************************************************************************************************************************

<br>

# :red_circle: ...OK I GONE DONE & MESSED UP, I BORKED MY BOARD! HELP!

Ok Don't panic you should be able to get it back by using the ST Link USB dongle to reflash either or both the Katapult Bootloader & Klipper again with the correct settings.

<br>

### :red_circle: REFLASHING KLIPPER WITH THE ST LINK

Rebuild the correct firmware making sure all pins are correct & the use the STM32Cube Programmer tool to flash the new klipper .bin file at `Start address` 0x08020000

Get the tool [here!](https://www.st.com/en/development-tools/stm32cubeprog.html)

****************************************************************************************************************************

<br>

# :red_circle: OK THATS GREAT BUT WHAT IF I DID SOMETHING CRAZY LIKE OVERWRITE THE BOOTLOADER?

Well thats definitely unfortunate! Now you have some extra work to do!
First you need to edit Katapult to allow the correct start application offset! Then you need to build new firmware & flash it with the ST Link.

Make sure you have the latest Katapult

```
cd ~/katapult && git pull
```

If it returns a no such file/dir run...

```
git clone https://github.com/Arksine/katapult
```

then run...

```
sudo nano ~/katapult/src/stm32/Kconfig
```

now add...

```
|| MACH_STM32H750
```
<br>

You need to do the same here as you did before with Klipper & add the Max's MCU to the list - CAREFULLY!!

<img width="1031" height="582" alt="KATAPULT" src="https://github.com/user-attachments/assets/21b51b94-d7cc-44f0-b249-74b85c874900" />

<br>
<br>

You will also need to go to the very bottom of the file & do the same for the Flash Settings section. Here you need to remove the `&& !MACH_STM32H750` & replace it with...

```
|| MACH_STM32H750
```
<br>

<img width="657" height="428" alt="KATAPULT SETTINGS 2" src="https://github.com/user-attachments/assets/97f1e5a2-327a-44d8-90c8-f3a28f05c16e" />

<br>
<br>

Once you have confirmed this is done correctly press `ctrl+X` & press `Y` to save the file & the hit `return` to confirm the name - leave it unchanged!

Now....

```
cd katapult
make menuconfig
```

Settings for Katapult:

<img width="645" height="221" alt="KATAPULT SETTINGS" src="https://github.com/user-attachments/assets/414c8ca3-ff68-4856-afae-400373dd639f" />

<br>
<br>

Once you've built the Katapult bootloader load it into STM32Cube Programmer do a full chip erase on the Max's MCU & flash the KATAPULT .bin file at `Start address` 0x08000000.

Then do the above section on flashing Klipper with the ST Link.

<br>
<br>
<br>
<br>

# REDUNDANT SECTIONS - REFERENCE ONLY - DO NOT FOLLOW

<details>
    <summary>
        <b>
        :red_circle: Click To Expand - Install Eddy NG - NO LONGER REQUIRED
        </b>
    </summary>
<p>
</p>
  
# NOTE EDDY NG IS LOOKING LIKE AN ABANDONED PROJECT RIGHT NOW. MAYBE SKIP THIS ONE!
...you'll have to fix a lot of stuff if you install it! 

Next head over to [Eddy NG](https://github.com/vvuk/eddy-ng)

```
cd ~
git clone https://github.com/vvuk/eddy-ng
```

& run the installer...

```
cd ~/eddy-ng
./install.sh
```

printer.cfg section:

```
[probe_eddy_ng eddy]
sensor_type: ldc1612
i2c_mcu: extra_mcu
i2c_software_scl_pin: extra_mcu:PB10
i2c_software_sda_pin: extra_mcu:PB11
# i2c_bus: i2c2
x_offset: -19.8
y_offset: -0.75

probe_speed: 5.0
lift_speed: 10.0
move_speed: 50.0
home_trigger_height: 2.0
calibration_z_max: 5.0
reg_drive_current: 15
tap_drive_current: 0
tap_start_z: 3.0
tap_target_z: -0.350
tap_mode: butter
tap_threshold: 250
tap_speed: 3.0
tap_adjust_z: 0.000
tap_samples: 3
tap_max_samples: 8
tap_samples_stddev: 0.025
```

Reboot now!

```
sudo reboot now
```


## :red_circle: CONFIGURE EDDY NG!

Follow the configuration steps here.
https://github.com/vvuk/eddy-ng/wiki/Calibration

<br>

### If automatic calibration keeps failing try running these commands top to bottom....

>[!NOTE]
>You can change the DRIVE_CURRENT from 15 to whatever value you want to calibrate at

```
SET_HEATER_TEMPERATURE HEATER=heater_bed TARGET=60
```
```
TEMPERATURE_WAIT SENSOR=heater_bed MINIMUM=58 MAXIMUM=62
```
```
G28 X Y
```
```
PROBE_EDDY_NG_CALIBRATE DRIVE_CURRENT=15
```

<br>

</details>

<br>

<details>
    <summary>
        <b>
        :red_circle: Click To Expand - Edit kconfig - NO LONGER REQUIRED
        </b>
    </summary>
<p>
</p>
  
# :red_circle: NOW THE TRICKY BIT! :cold_sweat:

# NOTE THE VERY LATEST VERSION OF KLIPPER DOES NOT REQUIRE THIS STEP - SKIP AHEAD A SECTION!

At the time of writing we need to edit Klipper to let us use a 128kib bootloader for the mainboard MCU! To do this we need to......

```
sudo service klipper stop
```

>[!CAUTION]
>Be EXTREMELY careful with this file & do NOT make any other edits or disrupt it's formatting in any way!

```
sudo nano ~/klipper/src/stm32/Kconfig
```

Scroll down to where it says `Bootloader` section surrounded by hashes in blue 

now add...

```
|| MACH_STM32H750
```

...to the end of the line that says `bool "128KiB bootloader" so it looks exactly the same as the rest of the section as per the image below.

<br>

<img width="895" height="576" alt="EDIT" src="https://github.com/user-attachments/assets/801e1a3d-1fab-42a1-a32f-d7b68d255568" />

<br>
<br>
<br>

Once you have confirmed this is done correctly press `ctrl+X` & press `Y` to save the file & the hit `return` to confirm the name - leave it unchanged!

```
sudo service klipper start
```

....& remember to breathe! Phew!

</detials>
