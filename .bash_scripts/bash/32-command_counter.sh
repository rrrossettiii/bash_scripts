#!/bin/bash
### _================
### _Command counter
### _================
### - WARNING: Very tempermental
[[ -z $SUCCESS_COUNTER ]] && export SUCCESS_COUNTER=0; #_(initiate success counter)
[[ -z $ERROR_COUNTER ]] && export ERROR_COUNTER=0; #_(initiate error counter)
capture_current(){
    local COMMAND_CODE=$?; #_(must be first!)
	export PREV_COMMAND=$THIS_COMMAND; #_(must be second!)
	export THIS_COMMAND=$BASH_COMMAND; #_(must be third!)
	
	if [[ -n $PREV_COMMAND ]];then #_(is command empty)
		if ! grep -q -E "history|setprompt|bashrc|__bs_file" <<< $PREV_COMMAND;then #_(ignored commands)
			if [[ $COMMAND_CODE == 0 ]];then 
				SUCCESS_COUNTER=$((SUCCESS_COUNTER+1)); #_(increment count)
			else
				ERROR_COUNTER=$((ERROR_COUNTER+1)); #_(increment count)
			fi
		fi
	fi
}
trap capture_current DEBUG #_(trap last command)
