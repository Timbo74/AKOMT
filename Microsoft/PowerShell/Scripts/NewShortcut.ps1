$shell = New-Object -comObject WScript.Shell
$shortcut = $shell.CreateShortcut("$env:PUBLIC\Desktop\A brand new shortcut.lnk")
$shortcut.TargetPath = "C:\Tools\Putty\PUTTY.EXE"
#$shortcut.Arguments = """\\machine\share\folder"""
$shortcut.Save()