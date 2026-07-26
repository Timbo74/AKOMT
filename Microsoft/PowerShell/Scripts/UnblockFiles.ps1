# Unblock a file
Unblock-File -Path "C:\path\to\your\file.exe"


# Unblock all files in a folder
Get-ChildItem "C:\path\to\folder" | Unblock-File

Get-ChildItem "C:\path\to\folder" -Recurse | Unblock-File

Get-ChildItem "." | Unblock-File

