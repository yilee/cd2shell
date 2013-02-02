--得到finder当期路径
tell application "Finder"
	set currentPath to POSIX path of (target of window 1 as alias)
end tell

tell application "Terminal"
	activate
	do script with command "clear; cd " & currentPath in window 1
	do script with command "pwd" in window 1
end tell
