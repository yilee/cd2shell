--注册系统快捷键

on run argv
	set argc to count of argv
	if (argc > 0) then
		openFinder()
	else
		openTerminal()
	end if
	return
end run

--从finder打开terminal
on openTerminal()
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
end openTerminal

--从terminal打开finder
on openFinder()
	--得到pwd值
	tell application "Terminal"
		set finderPath to (do shell script "pwd") as text
	end tell
	
	tell application "Finder"
		do shell script "cd ."
	end tell
	
	--窗口置顶
	tell application "System Events" to tell process "Finder"
		set frontmost to true
	end tell
	
end openFinder
