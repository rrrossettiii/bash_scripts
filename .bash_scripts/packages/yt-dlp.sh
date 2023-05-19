#!/bin/bash
### _================
### __yt-dlp
### _================

### _(directory layout)
### _================
### -- $YT_PATH (main yt directory)
###		\_ "_batches" (mkdir)
###			\_ i.e. "MTV" (make a batch file with video or playlist urls)
###		\_ "_archives" (mkdir)
###			\_ i.e. "MTV" (auto)
###		\_ "Library" (mkdir)
###			\_ i.e. "/MTV" (auto)

### _================
yt-batch(){ #_(batch individual file)
    cd $YT_PATH; #_(change working directory for nohup.out)
	local BATCH_NAME=$1 #_($1 == batch name)
	local PARAMS=(
		### _(Batch)
		--batch-file $YT_PATH/_batches/$BATCH_NAME #_(batch file path)

		### _(Library)
		-o "$YT_PATH/Library/$BATCH_NAME/%(title)s - [%(id)s]/%(title)s.%(ext)s" #_(output path)

		### _(Subs)
		--sub-langs "en"
# 		--write-auto-sub
		--embed-subs
		--add-metadata

		# COOKIES - YOUTUBE
		--cookies /mnt/THE_ABYSS/Media/youtube/cookies.txt

		### _(Recode)[prefer .mkv, h265]
		-S "codec:h265"
		--format bestvideo[ext=mp4]+bestaudio[ext=m4a]
		--merge-output-format mkv
		--recode-video mkv

		### _(Sponsor Block)
		--no-check-certificate
		--sponsorblock-remove all
		--force-keyframes-at-cuts

		### _(Archive)
		--download-archive $YT_PATH/_archives/$BATCH_NAME #_(download history)
		--break-on-existing #_(use download hisory ^^^)
		--break-per-input #_(continue the rest of inputs)
		)
    nohup yt-dlp "${PARAMS[@]}" &
}

### _================
yt-batch-all(){ #_(batch all files in /_batches)
	local YT_BATCHES=($(ls $YT_PATH/_batches/)) #_(get list of batch files)
	for i in "${!YT_BATCHES[@]}"
		do yt-batch "${YT_BATCHES[i]}" #_(run downloader for each batch file)
	done
	# tail -f nohup.out; #_(display output)
}
