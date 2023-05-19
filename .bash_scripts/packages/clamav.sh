### _================
### __clamav antivirus
### _================

### __aliases
### _================
alias clam-log='sudo $EDITOR $QUARANTINE/clamscan.log'
alias freshclam='sudo freshclam' ### get antivirus database
alias open-clam='systemctl start clamav-daemon' ### start clamav service
alias close-clam='systemctl stop clamav-daemon.socket; systemctl stop clamav-daemon' ### stop clamav service
alias test-clam='curl https://secure.eicar.org/eicar.com.txt | sudo clamscan -' ### test antivirus db

### __Scan + cleanup
### _================
std-test(){ ### $@ == path/to/files to scan & extra options
	### init
	open-clam;
	freshclam;
	test-clam;

	### options (add your own!)
	local PARAMS=(
		-r ### recursive
		-i ### print infected
		--bell ### ring bell
		--log=$QUARANTINE/clamscan.log ### log file /dir
		--move=$QUARANTINE ### quarantine /dir
	)

	### message
	printf "TEST COMPLETE: (confirm one file was detected)\n"
	printf "Scanning $1 recursively...";
	### start scan in bg
	noho sudo clamscan "${PARAMS[@]}" "$@"
}
