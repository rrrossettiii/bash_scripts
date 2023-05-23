#!/bin/bash
### _================
# ~/.bash_scripts/bash/64-ultimate_command_prompt.sh
### _================

### __is prompt enabled ???
[[ $USE_BS_PROMPT == 0 ]] && return

### __general
PS2="${GRAY}>${RESET} " ### continue command
PS3='Please enter a number from above list: ' ### script choice
PS4="${GRAY}+${RESET} " ### debug mode

### __error codes
EC_CODES=( 1 2 126 127 128 129 130 131 132 133 134 135 136 137 )
EC_1="General error"
EC_2="Missing keyword, command, or permission problem"
EC_126="Permission problem or command is not an executable"
EC_127="Command not found"
EC_128="Invalid argument to exit"
EC_129="Fatal error signal 1"
EC_130="Script terminated by Control-C"
EC_131="Fatal error signal 3"
EC_132="Fatal error signal 4"
EC_133="Fatal error signal 5"
EC_134="Fatal error signal 6"
EC_135="Fatal error signal 7"
EC_136="Fatal error signal 8"
EC_137="Fatal error signal 9"
EC_OUT="Exit status out of range"
EC_WILD="Unknown error code"

### __ssh util
SSH_IP="$(printf "${SSH_CLIENT}" | awk '{ print $1 }')"
SSH2_IP="$(printf "${SSH2_CLIENT}" | awk '{ print $1 }')"

### _================
### __Ultimate Command Prompt
### _================
function __setprompt {
	local LAST_COMMAND=$? ### must be first!

	### __decoration
	### _================
	local __='\[' ### non printable character start
	local ___='\]' ### non printable character end
	local NEXT='\n'
	local COLON=$__$RESET$___':'
	local AT=$__$BOLD$___'@'
	local START=$__$BLACK$___'('
	local SPACER=$__$BLACK$___')-('
	local END=$__$BLACK$___')'
	local ERROR=$__$RED$___'ERROR'
	local POINTER_SYMBOL='> '
	local POINTER_USER=$__$GREEN$___$POINTER_SYMBOL$__$RESET$___
	local POINTER_ROOT=$__$RED$___$POINTER_SYMBOL$__$LIGHT_RED$___

	### __info colors
	### _================
	local USER_NAME=$__$LIGHT_ORANGE$___
	local HOST_NAME=$__$ORANGE$___
	local DATE=$__$LIGHT_CYAN$___
	local TIME=$__$CYAN$___
	local JOBS=$__$PURPLE$___
	local CPU=$__$BLUE$___'CPU '$__$LIGHT_BLUE$___
	local NET=$__$GREEN$___'Net'$COLON$__$LIGHT_GREEN$___
	local CURRENT_DIR=$__$WHITE$___
	local DIR_FILES=$__$RESET$___
	local DIR_SIZE=$__$GRAY$___
	local CMD_COUNTER=$__$YELLOW$___
	local ERR_COUNTER=$__$LIGHT_YELLOW$___
	local ERROR_CODE=$__$LIGHT_RED$___

	### __utils
	### _================
	USER_NAME+='\u'
	HOST_NAME+='\h'
	DATE+="$(date +'%a %b %-d')"
	TIME+="$(date +'%-I:%M:%S%P')"
	JOBS+='\j'
	CPU+="$(top -bn1 | sed -n '/Cpu/p' | awk '{print $2}' | sed 's/..,//')"
	NET+="$(awk 'END {print NR}' /proc/net/tcp)"
	CURRENT_DIR+='\w'
	DIR_FILES+="$(ls -A -1 | wc -l)"
	DIR_SIZE+="$(ls -lah | grep -m 1 total | sed 's/total //')"
	CMD_COUNTER+=$SUCCESS_COUNTER
	ERR_COUNTER+=$ERROR_COUNTER
	ERROR_CODE+=$LAST_COMMAND

	### __host util
	### _================
	local REAL_HOST=$USER_NAME
	if [ $SSH2_IP ] || [ $SSH_IP ] ; then ### if ssh
		REAL_HOST+=$AT$HOST_NAME ### hostname
	fi
	### __pointer util
	### _================
	local POINTER=$POINTER_USER
	if [[ $EUID -eq 0 ]]; then ### if root user
		POINTER=$POINTER_ROOT ### change pointer
	fi

	### __error util
	### _================
	local ERROR_LINE=""
	if [[ $LAST_COMMAND != 0 ]]; then
		ERROR_LINE=$__$RING_BELL$___$START$ERROR$COLON$ERROR_CODE$SPACER$__$RED$___
		if [[ " ${EC_CODES[*]} " =~ " ${LAST_COMMAND} " ]]; then
			local ERROR_MESSAGE='EC_'$LAST_COMMAND
			ERROR_LINE+="${!ERROR_MESSAGE}"
		elif [ $LAST_COMMAND -gt 255 ]; then
			ERROR_LINE+=$EC_OUT
		else
			ERROR_LINE+=$EC_WILD
		fi
		ERROR_LINE+=$END$__$RESET$___$NEXT
	fi

	### _================
	### __Order
	### _================
	PS1='' ### clear PS1
	### __line 0
	PS1+=$ERROR_LINE
	### __line 1
	PS1+=$START
	PS1+=$DATE$SPACER$TIME
	PS1+=$SPACER
	PS1+=$CPU$COLON$JOBS
	PS1+=$SPACER
	PS1+=$NET
	PS1+=$END
	### __line 2
	PS1+=$NEXT$START
	PS1+=$REAL_HOST
	PS1+='('$CMD_COUNTER$COLON$ERR_COUNTER$__$ORANGE$___')'
	PS1+=$SPACER
	PS1+=$CURRENT_DIR
	PS1+=$SPACER
	PS1+=$DIR_FILES$COLON$DIR_SIZE
	PS1+=$END
	### __line 3
	PS1+=$NEXT
	PS1+=$POINTER
}

### __prevent += each time you reload .bashrc
### _================
if [[ -z $LOADED_COMMAND_PROMPT ]]; then
	export LOADED_COMMAND_PROMPT=1;
	PROMPT_COMMAND+=('__setprompt');
fi
