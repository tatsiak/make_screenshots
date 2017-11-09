display dialog "URL should look like 'http://anydomain.com?lang='"
set myLink to the text returned of (display dialog "Enter your URL" default answer "")
set lang_list to {"en", "cs", "da", "de", "es"}

do shell script "mkdir -p ~/Desktop/Screenshots"

repeat with lang in lang_list
	set file_Name to lang
	set url_to_capture to myLink & lang
	tell application "Paparazzi!"
		activate
		capture url_to_capture
		repeat
			if not busy then exit repeat
		end repeat
		save as JPEG in (the POSIX path of (path to desktop)) & "Screenshots/" & file_Name
	end tell
end repeat
tell application "Paparazzi!"
	quit
end tell
quit
