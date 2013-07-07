on alfred_script(q)
	set finderPath to ""
	
	tell application "Finder"
		try
			set finderFolder to (folder of the front window as alias)
		on error
			set finderFolder to (path to home folder as alias)
		end try
		set finderPath to quoted form of POSIX path of finderFolder
	end tell
	
	tell application "iTerm"
		activate
		tell the first terminal
			launch session "Default Session"
			tell the last session
				write text "cd " & finderPath
			end tell
		end tell
	end tell
end alfred_script