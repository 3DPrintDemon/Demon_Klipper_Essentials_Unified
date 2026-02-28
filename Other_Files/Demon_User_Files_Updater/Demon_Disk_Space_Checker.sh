#!/bin/bash

# 3DPrintDemon Demon Disk Space Checker v1.0.1

# Define
SPACE=`df -k --output=avail "$PWD" | tail -n1`
 
if [ $SPACE -lt 524250 ]; then
    df -h / --output=source,size,used,avail,pcent
    echo "_LOW_SPACE_PROMPT" >~/printer_data/comms/klippy.serial
    echo "Disk Space Check: WARNING less than 500MBs free!"

elif [ $SPACE -lt 1310625 ]; then
    df -h / --output=source,size,used,avail,pcent
    echo "Disk Space Check: Less than 1.5GBs free!"

elif [ $SPACE -lt 1048500 ]; then
    df -h / --output=source,size,used,avail,pcent
    echo "Disk Space Check: Less than 1GB free!"
      
else
    df -h / --output=source,size,used,avail,pcent
    echo "Disk Space Check: OK!"
fi
