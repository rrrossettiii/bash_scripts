#!/bin/bash
### _================
# ~/.bash_scripts/packages/yt-dlp.sh
### _================
### -> https://github.com/yt-dlp/yt-dlp

### _================
### Individual File
### _================
yt-batch(){
    cd $YT_PATH; ### change working directory for nohup.out
	local BATCH=$1 ### $1 == <BATCH_FILE.EXT>
	local BATCH_NAME=${BATCH%.*}

	local PARAMS=(
		### Batch File
		--batch-file $YT_PATH/_batches/$BATCH ### batch /file/path
		### Output
		-o "$YT_PATH/Library/$BATCH_NAME/%(fulltitle)s.%(ext)s" ### output /path/filename.ext

		### Subs
		--sub-langs "en"
		--embed-subs
		--convert-subs srt
		### Metadata
		--embed-info-json 
		--embed-metadata
		### Thumbnail
		--embed-thumbnail
		--convert-thumbnails png

		### COOKIES
		--cookies $YT_PATH/cookies.txt

		### Format
		-f "bv+ba/b"
		### Recode
		--merge-output-format mkv
		--recode-video mkv

		### Sponsor Block -> https://sponsor.ajay.app/
		--sponsorblock-mark all
		--sponsorblock-remove sponsor,selfpromo
		--force-keyframes-at-cuts

		### History
		--download-archive $YT_PATH/_archives/$BATCH ### download history
		--break-on-existing ### use download hisory ^^^
		--break-per-input ### continue the rest of inputs
		)
    nohup yt-dlp "${PARAMS[@]}" &
}

### _================
### Multiple Files
### _================
### batch all files in /_batches
yt-batch-all(){
	local YT_BATCHES=($(\ls $YT_PATH/_batches/)) ### get list of batch files
	for i in "${!YT_BATCHES[@]}"
		do yt-batch "${YT_BATCHES[i]}" ### run downloader for each batch file
	done
	# tail -f nohup.out; ### display output logs
}
