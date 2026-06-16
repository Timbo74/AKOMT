# Registry to Powershell Converter
# https://reg2ps.azurewebsites.net/

# --- Global Admins
# Get all global admins
Import-Module azuread
Connect-MsolService
Get-MsolRoleMember -RoleObjectId $(Get-MsolRole -RoleName "Company Administrator").ObjectId
Get-MsolRoleMember -RoleObjectId $(Get-MsolRole -RoleName "Company Administrator").ObjectId | Where-Object {$_.EmailAddress -like "zzSKContactAdmin_*"}

# Demote a bunch of global admins
# create CSV with 2 columns, UserPrincipalName and RoleName
$demotefn="<path and file name of the input CSV file that has the role changes, example: C:\admin\RoleUpdates.CSV>"
$roleChanges=Import-Csv $demotefn | ForEach { Remove-MsolRoleMember -RoleMemberEmailAddress $_.UserPrincipalName -RoleName $_.RoleName }

# Search for and disable signin for a bunch of accounts
get-azureaduser -All $true -Filter "startswith(UserPrincipalName,'zzSK')" | set-azureaduser -AccountEnabled $false

# Perform AAD Delta sync
Start-ADSyncSyncCycle -PolicyType Delta

# --- Junk email
#   Add to junk mail lists
Set-MailboxJunkEmailConfiguration "Michele Martin" -TrustedSendersAndDomains @{Add="contoso.com","fabrikam.com"} -BlockedSendersAndDomains @{Add="jane@fourthcoffee.com"}

#   List entries
(Get-MailboxJunkEmailConfiguration -Identity dugal@dugaljames.com.au).TrustedSendersAndDomains
(Get-MailboxJunkEmailConfiguration -Identity dugal@dugaljames.com.au).BlockedSendersAndDomains

# --- Domain / Enterprise admins
get-adgroupmember 'domain admins' | select name,samaccountname
get-adgroupmember 'enterprise admins' | select name,samaccountname

# --- Calendar stuff
#  Find all calendars for a user
Get-MailboxFolderStatistics -Identity 'username@domain' | ? { ($_.Identity -like "*calendar*") -and ($_.FolderType -ne 'CalendarLogging') } | FT Name,Identity,FolderPath,FolderType

#  List all calendars a user has specific access to (not via group membership)
Get-Mailbox | % { Get-MailboxFolderPermission (($_.PrimarySmtpAddress.ToString())+”:\Calendar”) -User *user1* -ErrorAction SilentlyContinue} | select Identity,User,AccessRights

#  Find permissions on calendar
Get-MailboxFolderPermission username@domain:\Calendar

# -- Mailbox permissions
Add-MailboxPermission user@domain -User grantee@domain.com -AccessRights FullAccess -AutoMapping $false
Remove-MailboxPermission user@domain -User grantee@domain.com -AccessRights FullAccess

Add-RecipientPermission "user@domain" -AccessRights SendAs -Trustee "grantee@domain.com"
Remove-RecipientPermission "user@domain" -AccessRights SendAs -Trustee "grantee@domain.com"

Set-Mailbox -Identity "user@domain" -GrantSendonBehalfTo "grantee@domain.com"
Get-Mailbox -Identity "user@domain" | FL GrantSendonBehalfTo

#   List all mailboxes a user has access to
Get-Mailbox -ResultSize Unlimited | Get-MailboxPermission -User username | ft User,Identity,AccessRights
Get-Mailbox -ResultSize Unlimited | Get-RecipientPermission -Trustee username | ft Identity,AccessRights

# Find an email address in exchange
Get-Recipient name@domain.com

# Enable SMTP auth for a mailbox
Set-CASMailbox -Identity <MailboxIdentity> -SmtpClientAuthenticationDisabled <$true | $false | $null>

# Check for Litigation Holds
Get-Mailbox -ResultSize Unlimited | select Name, UserPrincipalName, LitigationHoldEnabled

# Mailbox statistics
Get-Mailbox -ResultSize Unlimited -ErrorAction SilentlyContinue | get-mailboxstatistics -ErrorAction SilentlyContinue | Select-Object DisplayName, ItemCount, DeletedItemCount, TotalItemSize, SystemMessageSizeShutoffQuota | Export-Csv -Path C:\Temp\cust-output.csv -NoTypeInformation
# Notepad++ Regex transforms to turn this into a usable document

# Find: ^"(.*)",".*?\s[K|M|G]B\s\((.*)\sbytes\)","(\d{1,3}).*$
# Replace: "\1","\2","\3"

# Find: (\d),(\d)
# Replace: \1\2

# To create KB / MB / GB columns. Save in .xlsx format and adjust column type to number (2 decimal places)
# KB: bytes / 1024
# MB: KB / 1024
# GB: MB / 1024

# --- Printers
#  Install driver package
PNPUtil.exe /add-driver "C:\path\to\driver.inf" /install

# Add driver model
Add-PrinterDriver -Name "Driver model as specified in INF"

# --- Hyper-V
#  Get summary of used disk space
Get-VM | ForEach { $Vm = $_; $_.HardDrives } | ForEach { 
    $GetVhd = Get-VHD -Path $_.Path
    [pscustomobject]@{
        Vm = $Vm.Name
        Name = $_.Name
        Type = $GetVhd.VhdType
        ProvisionedGB = ($GetVhd.Size / 1GB)
        CommittedGB = ($GetVhd.FileSize / 1GB)
    }
} | Export-Csv -Path C:\Windows\Temp\hostname-hddspsace.csv -NoTypeInformation

# --- remote testing
# send test email
$creds = Get-Credential
Send-MailMessage -SmtpServer smtp.office365.com -Port 587 -From "user01@fabrikam.com" -To "user02@fabrikam.com" -Subject "Test mail" -UseSsl -Credential $creds

# remote speed test from command line
Invoke-WebRequest -Uri https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip -OutFile C:\Windows\Temp\speedtest.zip
Expand-Archive -Path C:\Windows\Temp\speedtest.zip -DestinationPath C:\Windows\Temp
C:\Windows\Temp\speedtest.exe -p no

# download iperf3 for LAN bandwidth testing
Invoke-WebRequest -Uri https://iperf.fr/download/windows/iperf-3.1.3-win64.zip -OutFile C:\Windows\Temp\iperf3.zip
Expand-Archive -Path C:\Windows\Temp\iperf3.zip -DestinationPath C:\Windows\Temp

# Get External IP
(Invoke-WebRequest -Uri https://ip.me).Content.Split([Environment]::NewLine) | Select-String "name=`"ip`""

powershell -command "{(Invoke-WebRequest -Uri https://ip.me).Content.Split([Environment]::NewLine) | Select-String 'name=`"ip`"'}"

# find all services running under a custom user
$Servers = "DC01", "DC02", "AzBuild01"
$ServiceName =  @{ Name = 'ServiceName'; Expression = {$_.Name}}
$ServiceDisplayname = @{ Name = 'Service DisplayName';  Expression = {$_.Caption}}

Invoke-Command $servers -ScriptBlock {Get-CimInstance -Class Win32_Service -filter "StartName != 'LocalSystem' AND NOT StartName LIKE 'NT Authority%' "} | 
            Select-Object SystemName, $ServiceName, $ServiceDisplayname, StartMode, StartName, State | format-table -autosize

# find all processes running as a particular user / users in multiple servers
$adComputers = "BDAC-AADC-01","BDAC-AD-01"
$adminMembers = "svc_prtg","btprobe"
foreach ($computer in $adComputers) {
    # foreach ($process in (Get-CimInstance -ComputerName $computer -ClassName Win32_Process -Filter "Name = 'program.exe'")) {
    foreach ($process in (Get-CimInstance -ComputerName $computer -ClassName Win32_Process)) {
        if ((Invoke-CimMethod -InputObject $process -MethodName GetOwner).User -in $adminMembers) {
            Write-Host "The computer [$($computer)] has process $($process.Name) running with process ID [$($process.ProcessId)]"
        }
    }
}

# Find entry in event viewer
Get-EventLog -LogName Security -InstanceId <eventid> -Newest 9000 | 
    Where {$_.Message -Like "*<username here>*"} | 
    Select -First 1 -ExpandProperty Message

# Remove deprecated registry entries from a GPO to fix "given key not present in the dictionary"
Remove-GPRegistryValue -Name "Default Domain Policy" -Key "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" -ValueName "DisableOSUpgrade"

# Find all AD users with roaming profiles (run as administrator)
Get-ADUser -Filter * -Properties Name, SAMAccountName, ProfilePath | Where {$_.ProfilePath -ne $null} | ft Name, SAMAccountName, ProfilePath

# -- M365 licensing

# Run this first to be able to read licensing data
# Install-Module Microsoft.Graph -force to install Microsoft Graph API
Connect-MgGraph -Scopes User.ReadWrite.All, Organization.Read.All

# List out licenses and counts in use
Get-MgSubscribedSku -All | fl *

# Check licensing against a specific user
Get-MgUserLicenseDetail -UserId "belindan@litwareinc.com"

# Get table of licenses available and in use
$licenses = Get-MgSubscribedSku
$licenseInfo = @()
foreach ($license in $licenses) {
    $skuId = $license.SkuId
    $skuPartNumber = $license.skuPartNumber
    $consumedUnits = $license.consumedUnits
    $enabledUnits = $license.prepaidUnits.enabled
    $availableUnits = $enabledUnits - $consumedUnits
    $licenseDetails = [PSCustomObject]@{
        Name              = $skuPartNumber
        SKUId             = $skuId
        ConsumedUnits     = $consumedUnits
        AvailableUnits    = $availableUnits
    }
    $licenseInfo += $licenseDetails
}
$licenseInfo | Format-Table -AutoSize

# Unassign license
Set-MgUserLicense -UserId "belindan@litwareinc.com" -AddLicenses @{} -RemoveLicenses @("skuid1","skuid2")
# Assign license
Set-MgUserLicense -UserId "belindan@litwareinc.com" -AddLicenses @{SkuId = "skuid"} -RemoveLicenses @()

# Get computer serial number
wmic bios get serialnumber
get-ciminstance win32_bios | format-list serialnumber

# get embedded windows license key
Get-CimInstance -query 'select * from SoftwareLicensingService' | fl OA3xOriginalProductKey

# query current logged in users
query session

# logoff other user
logoff <id>

# logoff
shutdown /l

# add local admin in backstage
net user newusername newpassword /add
net localgroup Administrators newusername /add
net localgroup "Remote Desktop Users" newusername /add

# re-sync password from domain server (backstage powershell)
Reset-ComputerMachinePassword -Server DomainServer -Credential DomainName\Administrator
Test-ComputerSecureChannel # should return True, if not then run
Test-ComputerSecureChannel -Repair -Credential DomainName\Administrator

# Uninstall Edge ... maybe. Don't update before you do this
%PROGRAMFILES(X86)%\Microsoft\Edge\Application\xxx\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall

# MSTSC Remote Desktop Client for Windows download
https://go.microsoft.com/fwlink/?linkid=2247659

# Microsoft RDP Beta for macOS
https://install.appcenter.ms/orgs/rdmacios-k2vy/apps/microsoft-remote-desktop-for-mac/distribution_groups/all-users-of-microsoft-remote-desktop-for-mac

# Determine FSMO pdc role
dsquery server -hasfsmo pdc

# determine roles in use
netdom query /d:domain.local fsmo
netdom query /d:domain.local pdc

# check connection to DC
nltest /sc_query:domain.local

# get all DC's that are accessible
nltest /dsgetdc:domain.local

# Add a computer to a domain
Add-Computer -DomainName Domain01 -Server Domain01\DC01 -PassThru -Verbose -NewName "newcomputername"

# Disable online requirement for Win10/11 OOBE (before connecting to network)
oobe\bypassnro
reg add HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE /v BypassNRO /t REG_DWORD /d 1 /f
# Post Win11 24H2
start ms-cxh:localonly

# Set a network adapter to private location
Get-NetConnectionProfile
Get-NetConnectionProfile -InterfaceAlias "Adapter name" | Set-NetConnectionProfile -NetworkCategory Private

# Send WoL packet to MAC
$Mac = "64:C9:01:E9:92:79"
$MacByteArray = $Mac -split "[:-]" | ForEach-Object { [Byte] "0x$_"}
[Byte[]] $MagicPacket = (,0xFF * 6) + ($MacByteArray  * 16)
$UdpClient = New-Object System.Net.Sockets.UdpClient
$UdpClient.Connect(([System.Net.IPAddress]::Broadcast),7)
$UdpClient.Send($MagicPacket,$MagicPacket.Length)
$UdpClient.Close()

# Get CSV of subfolder sizes quickly
# use DU https://learn.microsoft.com/en-us/sysinternals/downloads/du
# make sure you convert the encoding of the output file to UTF-8
du64.exe -accepteula -l 1 -nobanner -u -c C:\ParentFolder > C:\Windows\Temp\Output.csv

# Excel formula to get the last element of a path:
=RIGHT(A2,LEN(A2)+1-FIND("@",SUBSTITUTE("\"&A2,"\","@",(LEN(A2)-LEN(SUBSTITUTE("\"&A2,"\",""))+1))))

# Calculate checksum / hash of a file (available in all Windows versions)
certutil -hashfile filename MD5
certutil -hashfile filename SHA1
certutil -hashfile filename SHA256

# make a 7z archive of files and delete original files (useful workaround for files with a too-long path)
"C:\Program Files\7-Zip\7z.exe" a "C:\Windows\Temp\temp.7z" "C:\path\to\folder\" -r -sdel
# can also create a junction symbolic link to shorten the path but still work on it:
mklink /J link-name "\\.\C:\target\to\path\too\long"

# Save ACL's for later use
icacls d:\target\folder\* /save c:\temp\rights-acls.txt /t /c

# Restore ACL's
icacls d:\target\folder\* /restore c:\temp\rights-acls.txt

# taking ownership of files / folders
takeown /f "target folder" /r

# adding Administrators localgroup as ownership of files / folders
takeown /a /f "target folder" /r

# add a user with full control permissions to files recursively
icacls "target file / folder" /grant username:(F) /T /C

# force update group membership (as logged in user)
klist purge
taskkill /im explorer.exe /f
runas /user:%domain%\%username% explorer.exe

# sign an RDP shortcut file with gateway cert thumbprint
%WINDIR%\System32\rdpsign.exe /sha1 <thumbprint of cert> c:\location-of\termserver.rdp

# DPI Scaling in RD sessions
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Terminal Server\WinStations" /f /v IgnoreClientDesktopScaleFactor /t REG_DWORD /d 0
REG ADD "HKCU\Control Panel\Desktop" /f /v LogPixels /t REG_DWORD /d <desired-value> # 180 / 144 / 120 / 96 (96 is normal)

# Uninstall Windows Defender
Uninstall-WindowsFeature -Name Windows-Defender

# Export / import sticky notes (Win 10/11)
%LocalAppData%\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\plum.sqlite

# Clear the offline files cache
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Csc\Parameters\FormatDatabase = 1 (Dword)

# Disable power management on USB devices / PCI devices
Set-CimInstance -Query 'SELECT * FROM MSPower_DeviceEnable WHERE InstanceName LIKE "USB\\%"' -Namespace root/WMI -Property @{Enable = $false}
Set-CimInstance -Query 'SELECT * FROM MSPower_DeviceEnable WHERE InstanceName LIKE "PCI\\%"' -Namespace root/WMI -Property @{Enable = $false}

# Onedrive Sync Health reports (on-prem)
reg.exe add HKLM\Software\Policies\Microsoft\OneDrive /v EnableSyncAdminReports /t REG_DWORD /d 1

# Disk space cleanup things
cleanmgr /d c /sageset:10
cleanmgr /sagerun:10

# DPI settings for Surface Pro laptops
# https://dancharblog.wordpress.com/2019/06/26/custom-resolutions-with-windows-10-may-update-1903-and-intel-dch-uwd-gpu-drivers/

# copy fs logix profile disks to new server
robocopy \\ofwm-acs1\e$\Shares\FSLogix D:\Shares\FSLogix /R:0 /W:0 /MIR /SEC /SECFIX
robocopy \\ofwm-acs1\e$\Shares\OfficeCache$ D:\Shares\OfficeCache$ /R:0 /W:0 /MIR /SEC /SECFIX
robocopy \\ofwm-acs1\e$\Shares\fsl-profiles$ D:\Shares\fsl-profiles$ /R:0 /W:0 /MIR /SEC /SECFIX

# fix recovery environment
manage-bde status
# if there's no recovery key or its not encrypted properly
manage-bde -off C:
# wait for decryption to finish, check status with manage-bde status
reagentc /info
# if its disabled, attempt to enable it with this:
reagentc /enable
manage-bde -protectors -add -recoverypassword C:
manage-bde -on C:

# get current logged in user
$curUser = (Get-CimInstance -ClassName Win32_ComputerSystem).Username

# Remove computer from domain forcefully (no DC)
Remove-Computer -ComputerName "Server01", "localhost" -UnjoinDomainCredential Domain01\Admin01 -WorkgroupName "Local" -Restart -Force
netdom remove computername /Domain:domain /UserD:user /PasswordD:* /Force

# rclone commands for syncing sharepoint shit
rclone config # 38 for sharepoint

# this gets a csv of files at source and destination
rclone lsf --csv --format ps E:\Source\Data > output.csv
rclone lsf --csv --format ps remote: > output.csv

# this will run a check to see if files have synced and output a log file
rclone check E:\Data\Company sharepoint: --combined rclone-check.log

# sync data but dry run it 
rclone sync E:\source\data sharepoint: --exclude-from exclude.txt --ignore-checksum --ignore-size --dry-run --combined C:\Temp\rclone-sync-report.log

# copy data (no delete at destination)
rclone copy D:\Shares\Documents avard: --exclude "~$*" --exclude "Thumbs.db" --exclude "desktop.ini" --ignore-checksum --ignore-size --ignore-case --dry-run --combined D:\temp\rclone-log.txt

# sharepoint sync
rclone sync source remote: --ignore-checksum --ignore-size --exclude-from exclude.txt --ignore-case --dry-run --combined C:\Temp\rclone-sync-report.log

# rclone limit transactions per second and enforce deletes
rclone sync source remote: --tpslimit 10 --delete-before --dry-run --combined C:\Temp\rclone-sync-report.log

# rclone copy over empty folders
 rclone copy source: remote: --ignore-existing --dry-run --create-empty-src-dirs --combined C:\Temp\rclone-sync-report.log

 # rclone copy onedrive to onedrive
 rclone copy source: remote: --tpslimit 10 --onedrive-delta --fast-list --metadata --dry-run --combined C:\Temp\od-mc-username-date.log

# notepad++ regex search for changes in rclone combined log
^[\*,\+,\-,\!]\s.*$

# open settings
start ms-settings:

# Open Microsoft Store app
start shell:AppsFolder\DellInc.DellCommandUpdate_4.8.29.0_x86__htrsf667h5kn2!App
start shell:AppsFolder\DellInc.DellCommandUpdate_4.8.29.0_neutral_~_htrsf667h5kn2!App

# open resource monitor
perfmon /res

# open reliability monitor
perfmon /rel

# open classic devices and printers
shell:::{A8A91A66-3A7D-4424-8D24-04E180695C7A}
shell:printersfolder

# open network connections classic control panel
ncpa.cpl

# Open manage user profiles - run from admin cmd prompt to see all profiles
rundll32.exe sysdm.cpl,EditUserProfiles
# open stored creds
rundll32.exe keymgr.dll,KRShowKeyMgr

# Reinstall a specific appx package from ms store
$manifest = (Get-AppxPackage *AppName*).InstallLocation + '\AppxManifest.xml'
Add-AppxPackage -DisableDevelopmentMode -Register $manifest

# Find the driver version of a driver
Get-WmiObject Win32_PnPSignedDriver -Filter "DeviceName = 'Intel(R) Iris(R) Plus Graphics'" | select devicename, driverversion

# replace HTML % codes
[uri]::UnescapeDataString("Copied%20String")

# Setting TLS 1.2 as default in Windows Server
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

# To check
[System.Net.ServicePointManager]::SecurityProtocol

# Convert Windows Server Standard Evaluation to Server Standard and license
# https://learn.microsoft.com/en-us/windows-server/get-started/automatic-vm-activation
DISM /online /Set-Edition:ServerStandard /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula

# Export Start Menu layout
Export-StartLayout -Path "C:\Windows\Temp\LayoutModification.json"

# Force sync with Intune
$EnrollmentID = Get-ScheduledTask | Where-Object { $_.TaskPath -like "*Microsoft*Windows*EnterpriseMgmt\*" } | Select-Object -ExpandProperty TaskPath -Unique | Where-Object { $_ -like "*-*-*" } | Split-Path -Leaf
Start-Process -FilePath "C:\Windows\system32\deviceenroller.exe" -Wait -ArgumentList "/o $EnrollmentID /c /b"

# Get Scheduled Task Info incl actions
Get-ScheduledTask -TaskName "Install ScreenConnect" | Select-Object -ExpandProperty Actions

# query for all staff dynamic group
# 9aaf7827-d63c-4b61-89c3-182f06f82e5c = EXCHANGE_S_STANDARD, Exchange (Plan 1)
# efb87545-963c-4e0d-99df-69c6916d9eb0 = EXCHANGE_S_ENTERPRISE, Exchange (Plan 2)
# 4a82b400-a79f-41a4-b4e2-e94f5787b113 = EXCHANGE_S_DESKLESS, Exchange Online Kiosk
# Logic is roughly, if account is enabled, and isn't in the list of users to ignore, and they have an active Exchange license, add to group
(user.accountEnabled -eq true) -and (
  user.userPrincipalName -notin [
    "excludeduser1@domain.com",
    "excludeduser2@domain.com",
    "excludeduser3@domain.com"
  ]
) -and (
  user.assignedPlans -any (
    assignedPlan.servicePlanId -eq "9aaf7827-d63c-4b61-89c3-182f06f82e5c" -and assignedPlan.capabilityStatus -eq "Enabled"
  )
) or (
  user.assignedPlans -any (
    assignedPlan.servicePlanId -eq "efb87545-963c-4e0d-99df-69c6916d9eb0" -and assignedPlan.capabilityStatus -eq "Enabled"
  )
) or (
  user.assignedPlans -any (
    assignedPlan.servicePlanId -eq "4a82b400-a79f-41a4-b4e2-e94f5787b113" -and assignedPlan.capabilityStatus -eq "Enabled"
  )
)

# Change password from command line (local user):
net user <username> <NewPassword>
# domain user
net user <username> <NewPassword> /Domain

SystemSettingsAdminFlows.exe FeaturedResetPC

# Allow upgrade to Win11 with invalid TPM or CPU
HKLM:\System\Setup\MoSetup - DWORD - AllowUpgradesWithUnsupportedTPMorCPU = 1

# Allow install with invalid TPM:
HKLM:\System\Setup\LabConfig - DWORD - BypassTPMCheck = 1

# Allow install with invalid CPU:
HKLM:\System\Setup\LabConfig - DWORD - BypassCPUCheck = 1

# Allow install with no valid secure boot:
HKLM:\System\Setup\LabConfig - DWORD - BypassSecureBootCheck = 1

# Allow install with not enough ram:
HKLM:\System\Setup\LabConfig - DWORD - BypassRAMCheck = 1

# cmd line options for windows iso upgrade
# also /noreboot /quiet
# see: https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-setup-command-line-options?view=windows-11
setup.exe /auto clean /eula accept /compat ignorewarning /DynamicUpdate disable

# slipstreaming updates
# create 3 folders:
#  - win11iso - holds the copy of the ISO files
#  - wimlive  - where the wim is mounted
#  - win11updates - where msu updates are stored

# find specific index for image in wim
dism /get-imageinfo /imagefile:"C:\Temp\win11iso\sources\install.wim"

# mount wim to temp folder
dism /mount-wim /wimfile:"C:\Temp\win11iso\sources\install.wim" /index:6 /mountdir:"C:\Temp\wimlive"

# attempt to integrate all patches in a folder into wim
dism /add-package /Image:"C:\Temp\wimlive" /PackagePath:"C:\Temp\win1124h2updates"

# Add drivers to a mounted image
Dism /Image:"C:\Temp\wimlive" /Add-Driver /Driver:"c:\Temp\drivers" /Recurse

# Check packages have been integrated
dism /image:"C:\Temp\wimlive" /get-packages | more

# Cleanup
dism /image:"C:\Temp\wimlive" /cleanup-image /StartComponentCleanup /ResetBase

# Commit and unmount wim
dism /unmount-wim /mountdir:"C:\Temp\wimlive" /commit

# Patching WinPE with updated drivers
# Download latest driver pack for Surface here: 
# Unpack MSI with LessMSI 
# Copy required drivers to a separate folder, list is here: https://learn.microsoft.com/en-us/surface/enable-surface-keyboard-for-windows-pe-deployment

# Patch the boot.wim
Dism /Mount-Wim /WimFile:E:\sources\boot.wim /index:1 /MountDir:C:\mount\winInstall\
Dism /Image:C:\mount\winInstall\ /Add-Driver /Driver:C:\surface_laptop_3_drivers\ /Recurse
dism /image:C:\mount\winInstall\ /cleanup-image /StartComponentCleanup /ResetBase
Dism /Unmount-Image /MountDir:C:\mount\winInstall\ /Commit

Dism /Mount-Wim /WimFile:E:\sources\boot.wim /index:2 /MountDir:C:\mount\winBoot\
Dism /Image:C:\mount\winBoot\ /Add-Driver /Driver:C:\surface_laptop_3_drivers\ /Recurse
dism /image:C:\mount\winBoot\ /cleanup-image /StartComponentCleanup /ResetBase
Dism /Unmount-Image /MountDir:C:\mount\winBoot\ /Commit

# patch the main install.wim see above for mounting - can add all drivers not just the subset for winpe

# Patch the WinRE inside the WIM:
Dism /Mount-Wim /WimFile:C:\mount\windows\Windows\System32\Recovery\winre.wim /index:1 /MountDir:C:\mount\winre
Dism /Image:C:\mount\winre\ /Add-Driver /Driver:C:\surface_laptop_3_drivers\ /Recurse
dism /image:C:\mount\winre\ /cleanup-image /StartComponentCleanup /ResetBase
Dism /Unmount-Image /MountDir:"C:\mount\winre" /Commit
dism /image:C:\mount\windows\ /cleanup-image /StartComponentCleanup /ResetBase
Dism /Unmount-Image /MountDir:"C:\mount\windows\" /Commit


# disable new right-click menu
reg add HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 /ve /d "" /f

# old retention policies

# Start Managed Folder Assistant for an individual mailbox
Start-ManagedFolderAssistant "username@contoso.com"

# start Managed Folder Assistant (applies policies) - all  mailboxes
Get-Mailbox -Filter { (RecipientTypeDetails -eq 'UserMailbox') } -ResultSize Unlimited | ForEach-Object { Start-ManagedFolderAssistant $_.Identity }

# See what policy is applied to all mailboxes
Get-Mailbox -ResultSize Unlimited | Where-Object {$_.name -notlike '*DiscoverySearchMailbox*'} | Select-Object UserPrincipalName, RetentionPolicy

# Check when it was last run and what happened
[xml]$diag = (Export-MailboxDiagnosticLogs "username@contoso.com" -ExtendedProperties).MailboxLog
$diag.Properties.MailboxTable.Property | ? {$_.Name -like "ELC*"}

# Where current wallpaper picture is found
 %AppData%\Microsoft\Windows\Themes\CachedFiles

# Get current user and their SID
whoami /user

 # List of current user profiles and their SIDs
 HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList

 # Powershell to retrieve SID's and their ProfileImagePath value
 Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*' | Select-Object @{Name="SID";Expression={$_.PSChildName}}, ProfileImagePath | Format-Table -AutoSize

 # Get BIOS Windows Product key
 Get-CimInstance -query 'select * from SoftwareLicensingService' | fl OA3xOriginalProductKey

# Manually bootstrapping NuGet repo for powershell
Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208 -Force # On device that this works

# Copy over C:\Program Files\PackageManagement\ProviderAssemblies folder to disconnected / faulty device
Import-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208

# Kick off reset from command line
SystemSettingsAdminFlows.exe FeaturedResetPC

# Uninstall M365 Copilot App
Get-AppxPackage -AllUsers -Name "Microsoft.Copilot" | Remove-AppxPackage -AllUsers # Microsoft 365 Copilot
Get-AppxPackage -AllUsers -Name "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage -AllUsers # "Regular" Copilot

# DFS Utils
Add-WindowsCapability -Online -Name "Rsat.FileServices.Tools~~~~0.0.1.0"
dfsutil /PktInfo

# Get rid of the extra language packs from Windows
# Even if they are already there, install first then uninstall.
Install-Language -Language en-US
Install-Language -Language en-GB
Uninstall-Language -Language en-US
Uninstall-Language -Language en-GB

# install printmanagement.msc
Get-WindowsCapability -Name "Print.Management.Console*" -Online | Add-WindowsCapability -Online

forfiles /M *.m4a /C "cmd /c C:\ostools\ffmpeg-8.0.1\bin\ffmpeg.exe -hide_banner -loglevel error -i @file -c:a flac @fname.flac"

# Windows Firewall troubleshooting
auditpol /set /subcategory:"Filtering Platform Packet Drop" /success:enable /failure:enable
auditpol /set /subcategory:"Filtering Platform Connection"  /success:enable /failure:enable
netsh wfp show state # this drops an xml file into the current folder
# trigger issue, check event logs > Security, filter on event 5152 (audit failure / dropped packet), search for identifying details
# identify filter ID, search in XML for filter ID and then under displayData > Name will have the name of the rule (filterKey will have GUID)
# Rules are found in registry under HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules
# disable extra auditing:
auditpol /set /subcategory:"Filtering Platform Packet Drop" /success:disable /failure:disable
auditpol /set /subcategory:"Filtering Platform Connection"  /success:disable /failure:disable

# Connect to a sharepoint online admin
Install-Module -Name Microsoft.Online.Sharepoint.PowerShell -scope currentuser  
Connect-SPOService -url https://siteaddress-admin.sharepoint.com

# Disable onedrive shortcuts in Sharepoint
Set-SPOTenant -DisableAddShortCutsToOneDrive $True

# Find old office lock files using Windows Explorer dates might be mm/dd/yyyy depending on locale
name:~"~$*.*" datemodified:01/01/1980 .. 02/01/2026

# Reg key to enable long pathnames set and reboot
# note Windows File Explorer still doesn't work
HKLM\SYSTEM\CurrentControlSet\Control\FileSystem DWORD LongPathsEnabled = 1

# Temp exclusion to defender guard / ASR rules
Add-MpPreference -AttackSurfaceReductionOnlyExclusions "C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing"
Add-MpPreference -ExclusionPath "C:\Path\to\folder"
# then reboot
# use Remove-MpPreference to remove them again
# use Get-MpPreference to see them

# Manual uninstall NinjaOne
# This adds a shortcut to the folder C:Program Files (x86)\NinjaOne to run
"C:Program Files (x86)\NinjaOne\NinjaRMMAgent.exe" -disableUninstallPrevention
# Run the shortcut in backstage via file explorer to uninstall it, then reboot

# Run tasks headless / no popup window in scheduled tasks
Command: C:\Windows\System32\conhost.exe
Arguments: --headless cmd.exe arg1 arg2 "C:\a quoted path"

# rollback a package
dism /online /get-packages # get name of package to be rolled back
dism /online /remove-package /packagename:"Package_for_RollupFix~31bf3856ad364e35~amd64~~26100.7623.1.20" /norestart