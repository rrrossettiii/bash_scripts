#!/bin/bash
### _================
### __yt-dlp
### _================

### directory layout
### _================
### -- $YT_PATH [$ mkdir $YT_PATH]
###		\__ '/_batches' [$ mkdir $YT_PATH/_batches]
###		  \__'BATCH_NAME' [$ $EDITOR $YT_PATH/_batches/<BATCH_NAME>]
###		\__'/_archives' [$ mkdir $YT_PATH/_archives]
###		  \__'BATCH_NAME' <auto>
###		\__'/Library' [$ mkdir $YT_PATH/Library]
###		  \__'/BATCH_NAME' <auto>

### _================
yt-batch(){ ### batch individual file
    cd $YT_PATH; ### change working directory for nohup.out
	local BATCH_NAME=$1 ### $1 == <BATCH_NAME>
	local PARAMS=(
		### Batch
		--batch-file $YT_PATH/_batches/$BATCH_NAME ### batch /file/path

		### Library
		-o "$YT_PATH/Library/$BATCH_NAME/%(title)s - [%(id)s]/%(title)s.%(ext)s" ### output /path

		### Subs
		--sub-langs "en"
# 		--write-auto-sub
		--embed-subs
		--add-metadata

		### COOKIES - YOUTUBE
		# --cookies $YT_PATH/cookies.txt

		### Recode [prefer .mkv, h265]
		-S "codec:h265"
		--format bestvideo[ext=mp4]+bestaudio[ext=m4a]
		--merge-output-format mkv
		--recode-video mkv

		### Sponsor Block
		--no-check-certificate
		--sponsorblock-remove all
		--force-keyframes-at-cuts

		### History
		--download-archive $YT_PATH/_archives/$BATCH_NAME ### download history
		--break-on-existing ### use download hisory ^^^
		--break-per-input ### continue the rest of inputs
		)
    nohup yt-dlp "${PARAMS[@]}" &
}

### _================
yt-batch-all(){ ### batch all files in /_batches
	local YT_BATCHES=($(ls $YT_PATH/_batches/)) ### get list of batch files
	for i in "${!YT_BATCHES[@]}"
		do yt-batch "${YT_BATCHES[i]}" ### run downloader for each batch file
	done
	# tail -f nohup.out; ### display output
}
