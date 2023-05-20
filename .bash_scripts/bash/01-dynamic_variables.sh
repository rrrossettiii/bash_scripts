#!/bin/bash
### _================
### __dynamic variables
### _================

alias HERE='cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd' ### directory path of wherever this line is run
export DRIVE_PATHS=($(df -h -t $DRIVE_FS | tail -n+2 | awk '{print $1}')) ### array of partitions
export MOUNT_POINTS=($(df -h -t $DRIVE_FS | tail -n+2 | awk '{print $NF}')) ### array of mount points
