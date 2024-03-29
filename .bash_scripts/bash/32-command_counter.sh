#!/bin/bash
### _================
# ~/.bash_scripts/bash/32-command_counter.sh
### _================

### *** WARNING: Very tempermental
### _================
[[ -z $SUCCESS_COUNTER ]] && export SUCCESS_COUNTER=0; ### initiate success counter
[[ -z $ERROR_COUNTER ]] && export ERROR_COUNTER=0; ### initiate error counter
capture_current(){
    local COMMAND_CODE=$?; ### must be first!
	export PREV_COMMAND=$THIS_COMMAND; ### must be second!
	export THIS_COMMAND=$BASH_COMMAND; ### must be third!
	
	if [[ -n $PREV_COMMAND ]];then ### if command empty
		if ! grep -q -E "history|setprompt|bashrc|__bs_file" <<< $PREV_COMMAND;then ### ignored commands
			if [[ $COMMAND_CODE == 0 ]];then 
				SUCCESS_COUNTER=$((SUCCESS_COUNTER+1)); ### increment count
			else
				ERROR_COUNTER=$((ERROR_COUNTER+1)); ### increment count
			fi
		fi
	fi
}
trap capture_current DEBUG ### trap 'last' command
