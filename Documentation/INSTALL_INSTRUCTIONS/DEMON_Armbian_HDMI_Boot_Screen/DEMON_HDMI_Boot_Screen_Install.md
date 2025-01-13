# DEMON Armbian HDMI Boot Screen Install

This install requires you to modify system files! If you are uncomfortable doing this please read on & decide if you want to do this. It's not very complex but it does need to be done correctly.

Here you will save a backup of your current boot screen file & replace it with the Demon version. 

## To do this you MUST be running an Armbian system!! No if's buts or coconuts! 
## DO NOT TRY TO USE ON AN DEBIAN SYSTEM

MAKE A BACKUP OF YOUR PRINTER &/OR YOUR CONFIG FOLDER!!!!

![DEMON_Armbian_Boot](https://github.com/user-attachments/assets/fb98da30-1f13-4490-9dfd-861b4a979488)


# This example has been tested WORKING on the STOCK SV08 system 
# IT IS NOT USABLE ON SV08 MAINLINE KLIPPER HOWEVER

Download the file by clicking the link or pasting the command into your SSH terminal


# Backup Your Current File!

Open your chosen SFTP client & login to your SV08

Navigate to....
```
/usr/lib/firmware/bootsplash.armbian
```

find the `bootsplash.armbian` file already in your system & download it to keep safe as a backup!!! IMPORTANT!!!

## Download The DEMON file

Download the `bootsplash.armbian` file here.

https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/tree/main/Other_Files/DEMON_Armbian_HDMI_Boot_Screen

# Install direct via SSH 

This will download the file to your user directory

```
cd ~

wget https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/raw/refs/heads/main/Other_Files/DEMON_Armbian_HDMI_Boot_Screen/bootsplash.armbian
```

## Now to copy it to the correct directory ready for use

Run this command to copy the file to the correct directory
```
sudo cp ~/bootsplash.armbian /usr/lib/firmware/bootsplash.armbian
```

Once that's done its time update the system to use it. Your pi will run a load of commands that will scroll & there'll be a small wait at the end as it finishes.
```
sudo update-initramfs -v -u
```
It's time to reboot the pi to use the new boot screen!

```
sudo reboot now
```

••••••••••••••••••••••••••••••••••••••••
## Screen Inverted?
If your boot screen is flipped you can either rotate your screen with the button (BTT TFT50/70) & then edit the system boot file to invert KlipperScreen
```
sudo nano boot/system.cfg
```

Then uncomment the KS screen rotation option & select inverted.

Save & exit.

```
sudo reboot now
```

Or you can simply upload the 180 inverted bootscreen...

```
wget https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/raw/refs/heads/main/Other_Files/DEMON_Armbian_HDMI_Boot_Screen/Boot_Screen_180/bootsplash.armbian
```



## DISCLAIMER - USE WITH CAUTION!!

I am in no way responible for your use of this file &/or if anything bad happens to your printer or system. Running this file is on you, so is any & all results of it.

