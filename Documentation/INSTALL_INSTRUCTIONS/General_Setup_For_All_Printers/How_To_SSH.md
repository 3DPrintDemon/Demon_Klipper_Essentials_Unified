# HOW TO SSH!

Be sure to use something like WinSCP or Putty on WindowsPC or Terminal on MacOS to log into your system via SSH, you'll need your printer's IP address along with its account name & password.

- Open a new SSH terminal & write in the below example but replacing the objects between the `< >` (NOT including the `<>` less/more than or xx symbols.) with your printer's information. 

```
EXAMPLE
ssh <pi>@<192.168.1.xx>

NOT including the <> less/more than symbols or the xx on the end.

<pi> = your printer's account name, so biqu, pi, mks, sovol for example

<192.168.1.xx> = your printer's full IP address replacing the example numbers with yours.

This can be found from your WiFI router in most cases.
```
```
So basically the command will be something that will look like....

EXAMPLE
ssh pi@192.168.1.95
```

- Once you have input the correct account name & IP address as above 

- Press return

- Then the terminal will ask you for your password. Enter it, it wont be displayed on screen but it will be working.

- Press return again to login.

You're now ready to begin issuing commands to install the macros.

### [Head Back to Where You Were...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#not-sure-how-to-ssh)
