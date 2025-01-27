# Auto_Backup_Your_Klipper_Printer
## Backups with a single click and automatically on the hour every hour!


Follow the guide in the link below for the best instructions. 

### WARNING: 
This is not for beginners or the faint of heart! You will be giving commands directly to your Pi via SSH terminal & creating your own access tokens & filling important infomation that has to be correct for any of this to work.  
Huge thanks for the Voron team for sharing the guide below!

https://docs.vorondesign.com/community/howto/EricZimmerman/BackupConfigToGithub.html
**************************************************************************************************************
## BUT FIRST!!! Make sure your Pi has the correct timezone/time & date! Google should help you do this.

# ALSO manually select all your files in Mainsail & download them to your computer so you have a current & local backup of your configs BEFORE YOU DO ANYTHING ELSE!

To log into ssh on a SV06/+ or SV07/+ Klipper screen the default user is mks & password is makerbase. 

**************************************************************************************************************
### ...Oh, & whatever you do DO NOT, I repeat, DO NOT run any update commands via ssh on the SV06/+ or SV07/+ Klipper screens! You have been warned. 
**************************************************************************************************************



### While the linked guide is fantastic recent changes on Github seem to throw us a couple of possible errors....

## Possible Error #1
If you do all the setup & go for your first autocommit but get “Updates were rejected because the tip of your current branch is behind” error. 
To get it working in MAIN branch after setup steps but before first `sh autocommit.sh` do this:

```
git config pull.rebase true
git pull <Token@URL>
git branch -m main
git push origin HEAD:main
sh autocommit.sh
```
be sure to add your token & url in the above commands! 
The last two lines will basically do the same thing but they are there to test they both work. 

## Possible Error #2
If you get “error: failed to push some refs to 'https://…….” on your first autocommit edit the `Autocommit.sh` file:

In Push config section at the very bottom replace the last line where it says `git push origin $branch` with 
```
git push origin HEAD:main
```
**************************************************************************************************************
## Helpful Commands
Use this to reset/change Git Repo for backups if you made a mistake or need to change repo. In the link below you must edit it to contain your correct/new access token & correct/new git url as it mentions in the linked guide:
```
git remote set-url origin https://<YOUR_NEW_TOKEN>@<YOUR_NEW_GIT_URL>
```

Use this command to see what email information git is using.
```
git config --global user.email
```

To change email use.
```
git config --global user.email "YOUR_EMAIL"
```

Edited commands for other SBC systems, eg MKS the ones in the guide will not work use these, change mks to biqu or othwer if needed:
```
 wget -O /home/mks/printer_data/config/autocommit.sh https://raw.githubusercontent.com/EricZimmerman/VoronTools/main/autocommit.sh
```
```
 nano /home/mks/printer_data/config/autocommit.sh
```
```
 wget -O /home/mks/klipper/klippy/extras/gcode_shell_command.py https://raw.githubusercontent.com/th33xitus/kiauh/master/resources/gcode_shell_command.py
```
**************************************************************************************************************
## RPi Edited Macro
Edited config_backup.cfg for RPi based systems. Instead of using the macro in the guide use this, better backup name:
```
[gcode_shell_command backup_printer]
command: /usr/bin/bash /home/pi/printer_data/config/autocommit.sh
timeout: 30
verbose: True

[gcode_macro BACKUP_PRINTER]
description: Backs up config directory GitHub
gcode:
     RUN_SHELL_COMMAND CMD=backup_printer
```


**************************************************************************************************************
## Other SBC Macro
Edited config_backup.cfg for MkS system, change to biqu or other if needed. Instead of using the macro in the guide use this, as it wont work plus better backup name:
```
[gcode_shell_command backup_printer]
command: /usr/bin/bash /home/mks/printer_data/config/autocommit.sh
timeout: 30
verbose: True

[gcode_macro BACKUP_PRINTER]
description: Backs up config directory GitHub
gcode:
     RUN_SHELL_COMMAND CMD=backup_printer
```
**************************************************************************************************************

## Sovol SV08 Macro
Edited config_backup.cfg for Sovol SV08. Instead of using the macro in the guide use this, as it wont work plus better backup name. change mks sovol in the path to biqu if on mainline:
```
[gcode_shell_command backup_printer]
command: /usr/bin/bash /home/sovol/printer_data/config/autocommit.sh
timeout: 30
verbose: True

[gcode_macro BACKUP_PRINTER]
description: Backs up config directory GitHub
gcode:
     RUN_SHELL_COMMAND CMD=backup_printer
```
**************************************************************************************************************

## Shell command for running auto backups hourly on the hour:

Run this then choose option #1
```
crontab -e
```
Then for RPi systems paste this in at the bottom of the new file:
```
0 * * * * /usr/bin/bash /home/pi/printer_data/config/autocommit.sh >/dev/null 2>&1
```
This version for the SV06/+ SV07/+ with Sovol Klipper screens
```
0 * * * * /usr/bin/bash /home/mks/printer_data/config/autocommit.sh >/dev/null 2>&1
```
This version for the SV08
```
0 * * * * /usr/bin/bash /home/sovol/printer_data/config/autocommit.sh >/dev/null 2>&1
```
Now save & exit. Reboot.
**************************************************************************************************************

### Be warned this is fairly technical & requires some knowledge to do, please be careful. Any mistakes resulting in damage to the system because you did something is bad & totally on you!

# TO REMOVE THIS FEATURE! 

This will remove the remote linked repo folder on your pi. Note change `pi` to `mks` for SV06/+/07/+ machines.

## BE VERY CAREFUL WITH THESE COMMANDS!! GET IT WRONG YOU CAN WIPE EVERYTHING!

```
cd /home/pi/
rm -r .git
```
or if you prefer...

```
rm -r /home/pi/.git
```

Then this will purge all config data from git.
```
sudo apt-get purge git
```
If you wish to remove git entirly afterwards
```
sudo apt-get remove git
```

Or there is this combined purge then remove command
```
sudo apt-get purge --auto-remove git
```

Now type... 

``` 
crontab -e
```

...& delete the last line of the file you originally entered. Save & exit

Now go to github & navigate to your settings for the access tokens & revoke the token for your machine.

Then finally delete the `autocommit.sh` file & the `config_backup.cfg` file on your printer, dont forget to remove the `[include config_backup.cfg]` line in your `printer.cfg` also.

Your backup repo will still be stored on Github until you delete it.

# IF SELLING YOUR PRINTER 
If you're selling your machine & you don't want anyone possibly finding out what you typed in ssh like login info or email addresses it might be a good idea to do this.
The commands below will clear the ssh history file & then write the current history to file then delete that file.
```
history -c && history -w
```
then type...
```
rm ~/.bash_history
```
