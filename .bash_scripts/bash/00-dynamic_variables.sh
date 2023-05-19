#!/bin/bash
### _================
### __Dynamic variables
### _================
alias HERE='cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd' #_(directory path of wherever this line is run)
export DRIVE_PATHS=($(df -h -t $DRIVE_FS | tail -n+2 | awk '{print $1}')) #_(array of partitions)
export MOUNT_POINTS=($(df -h -t $DRIVE_FS | tail -n+2 | awk '{print $NF}')) #_(array of mount points)