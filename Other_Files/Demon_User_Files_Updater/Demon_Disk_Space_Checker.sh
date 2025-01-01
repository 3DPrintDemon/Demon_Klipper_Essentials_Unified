#!/bin/bash
 
# Define
SPACE=`df -k --output=avail "$PWD" | tail -n1`
 
if [ $SPACE -lt 104850 ]; then
    df -h / --output=source,size,used,avail,pcent
    echo "_LOW_SPACE_PROMPT" >~/printer_data/comms/klippy.serial
    echo "Disk Space Check: WARNING less than 100MBs free!"
      
else
    df -h / --output=source,size,used,avail,pcent
    echo "Disk Space Check: OK!"
fi