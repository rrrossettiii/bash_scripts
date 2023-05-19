#!/bin/bash
### _================
### __smartctl
### _================

alias smart-logs='journalctl -f -u smartd'
smart-status(){ ### print smartctl drive temps
	[[ -z $SMART_DRIVES ]] && export SMART_DRIVES=($(sudo smartctl --scan-open | awk '{print $1}'))
	for i in "${!SMART_DRIVES[@]}" ### "!" to print index
		do
			printf "\n${SMART_DRIVES[i]}:\n";
			sudo smartctl -H "${SMART_DRIVES[i]}" | grep SMART | decap;
			sudo smartctl -x "${SMART_DRIVES[i]}" | grep -E "Current Temperature:|Limit:|Temp. Threshold:|Sensor";
	done
}
drive-checkup(){
	[[ -z $SMART_DRIVES ]] && export SMART_DRIVES=($(sudo smartctl --scan-open | awk '{print $1}'))
	for i in "${!SMART_DRIVES[@]}"
		do
			printf "\n${SMART_DRIVES[i]}:\n";
			sudo smartctl -t long "${SMART_DRIVES[i]}"
	done
}
