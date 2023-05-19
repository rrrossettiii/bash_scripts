### _================
### __clamav antivirus
### _================

### __aliases
### _================
alias clam-log='sudo $EDITOR $QUARANTINE/clamscan.log'
alias freshclam='sudo freshclam' #_(generate antivirus database)
alias open-clam='systemctl start clamav-daemon' #_(start clamav service)
alias close-clam='systemctl stop clamav-daemon.socket; systemctl stop clamav-daemon' #_(stop clamav service)
alias test-clam='curl https://secure.eicar.org/eicar.com.txt | sudo clamscan -' #_(test antivirus db)

### __Scan + cleanup
### _================
std-test(){ #_($@ = path to files to scan & extra options)
	### _(init)
	open-clam;
	freshclam;
	test-clam;

	### _(options)[add your own]
	local PARAMS=(
		-r #_(recursive)
		-i #_(print infected)
		--bell #_(ring bell)
		--log=$QUARANTINE/clamscan.log #_(log file /dir)
		--move=$QUARANTINE #_(quarantine /dir)
	)

	### _(message)
	printf "TEST COMPLETE: (confirm one file was detected)\n"
	printf "Scanning $1 recursively...";
	### _(start scan in bg)
	noho sudo clamscan "${PARAMS[@]}" "$@"
}
