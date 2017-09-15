Set WshShell = CreateObject("WScript.Shell")
WshShell.Run WScript.Arguments(0) & " " & WScript.Arguments(1), 0
Set WshShell = Nothing