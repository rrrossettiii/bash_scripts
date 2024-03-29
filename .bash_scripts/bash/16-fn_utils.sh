#!/bin/bash
### _================
# ~/.bash_scripts/bash/16-fn_utils.sh
### _================

### functions
### _================
hide-item(){
	sudo mv $1 .$1;
}
noho(){ ### run nohup command without nohup.out
	nohup "$@" </dev/null >/dev/null 2>&1 \
	& printf "Running (bg):\t$@ \nw/o: (hangups & nohup.out)\n";
}
mvv(){ ### 'noho' move item
	noho mv "${@}"; ### should work with *
}
paint(){ ### color text [$ `paint $1 $2`]
    local -n color=$2 ### set color $2
    printf $color$1$RESET ### color text $1
}
label(){ ### label helper
    printf "\n\t\t[$(paint $1 $2)]\n";
}
test-array(){ ### i.e. [$ `test-array DRIVE_PATHS`]
	local arr=$1[@]
	local array=("${!arr}")
	for i in "${!array[@]}"
		do printf "$i:\t${array[i]}\n" ### print each array item
	done
}
### remove files
### _================
FIND_IGNORE=( ### ignore these filetypes
	### video
	-a ! -name "*.mkv"
	-a ! -name "*.mp4"
	-a ! -name "*.m4v"
	-a ! -name "*.mpg"
	-a ! -name "*.avi"
	-a ! -name "*.ogm"
	-a ! -name "*.ogv"
	-a ! -name "*.flv"

	### subtitle
	-a ! -name "*.ass"
	-a ! -name "*.sub"
	-a ! -name "*.srt"
	-a ! -name "*.idx"

	### image
	-a ! -name "*.jpg"
	-a ! -name "*.png"

	### books
	-a ! -name "*.ydb"
	-a ! -name "*.cbz"
	-a ! -name "*.cbr"

	### archive
	-a ! -name "*.zip"
	-a ! -name "*.rar"
	
	### yt-dlp
	# -a ! -name "*.description"
)
FIND_ALLOW=(
	-name "" ### keep this
	-o -name "*.website"
	# -o -name "*.rtf"
	-o -name "*.DS_Store" ### OSX
)
### _================
### --(args): $1 == <directory>; $2 == -delete;
### --(i.e.): `find /mnt` or `find /mnt -delete`
### _================
sweep(){ ### look for *NOT* $FIND_IGNORE
	find $1 -type f "${FIND_IGNORE[@]}" $2;
}
scrub(){ ### look for #FIND_ALLOW
	find $1 -type f "${FIND_ALLOW[@]}" $2;
}
