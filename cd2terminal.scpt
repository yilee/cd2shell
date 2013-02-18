--注册系统快捷键

on run argv
	set argc to  count of argv
	if (argc > 0) then
		openFinder("测试")
	else
		openTerminal()
	end if
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
on openFinder(path)
	tell application "Finder"
		display dialog path as text buttons {"OK"}
	end tell
end openFinder
