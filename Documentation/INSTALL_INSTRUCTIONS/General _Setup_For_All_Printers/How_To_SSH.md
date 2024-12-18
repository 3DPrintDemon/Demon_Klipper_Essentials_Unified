If you feel these macros are valuable enough to download & use please consider hitting that "sponsor this project" button or the Ko-Fi image below or at https://ko-fi.com/3dprintdemon & buying me a beer/coffee. Its always very much appreciated & anything you do send goes towards helping me continue putting my ideas out there for the whole 3D printing community. Sending even a little makes a difference! Thank you & happy printing!!

[<img width="171" alt="kofi_s_tag_dark" src="https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/08473899-563b-4b4d-9409-5e6602d6ec44">](https://ko-fi.com/3dprintdemon)

****************************************************************************************************************************

# HOW TO SSH!

Be sure to use something like Putty or MacOS Terminal to log into your system via SSH, you'll need your printer's IP address along with its account name & password.

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
EXAMPLE
So basically the command will be something that will look like....


ssh pi@192.168.1.95
```

- Once you have input the correct account name & IP address as above 

- Press return

- Then the terminal will ask you for your password. Enter it, it wont be displayed on screen but it will be working.

- Press return again to login.

You're now ready to begin issuing commands to install the macros.

### [Head Back to Where You Were...](https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/blob/main/Documentation/INSTALL_INSTRUCTIONS/General%20_Setup_For_All_Printers/INSTALL_INSTRUCTIONS.md#not-sure-how-to-ssh)
