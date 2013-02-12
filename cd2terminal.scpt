--得到finder当期路径
tell application "Finder"
	set currentPath to POSIX path of (target of window 1 as alias)
end tell

--激活
tell application "Terminal"
	--activate
	do script with command "cd " & currentPath in window 1
	do script with command "clear" in window 1
	do script with command "pwd" in window 1
end tell

--窗口置顶
tell application "System Events" to tell process "Terminal"
	set frontmost to true
end tell