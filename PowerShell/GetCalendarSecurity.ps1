#https://learn.microsoft.com/en-us/powershell/module/exchange/set-mailboxfolderpermission?view=exchange-ps#parameters

Connect-ExchangeOnline

Write-Host "Getting mailboxes..." -NoNewline
$Mailboxes = Get-Mailbox -ResultSize 2000 | Select-Object -Property DisplayName, UserPrincipalName, IsResource | Sort-Object -Property DisplayName
Write-Host " done."

$CalendarList = @()

Write-Host "Checking Calendar settings..."
foreach($Mailbox in $Mailboxes)
{
    $CalendarIdentity = $Mailbox.UserPrincipalName + ":\Calendar"
    
    Write-Host "Checking " -NoNewline
    Write-Host $Mailbox.DisplayName -NoNewline
    Write-Host " [$($Mailbox.IsResource): $CalendarIdentity]" -NoNewline -ForegroundColor DarkGray
    Write-Host ": " -NoNewline

    #$CalendarFolder = Get-MailboxCalendarFolder -Identity $CalendarIdentity
    $CalendarPermission = Get-MailboxFolderPermission -identity $CalendarIdentity | Where-Object {$_.User.DisplayName -eq 'Default'}

    Switch ($CalendarPermission.AccessRights[0].ToString())
    {
        "Editor" {Write-Host $CalendarPermission.AccessRights[0].ToString() -ForegroundColor Red}
        "Reviewer" {Write-Host $CalendarPermission.AccessRights[0].ToString() -ForegroundColor Red}
        "LimitedDetails" {Write-Host $CalendarPermission.AccessRights[0].ToString() -ForegroundColor Red}
        default {Write-Host $CalendarPermission.AccessRights[0].ToString()}
    }

    $CalendarItem = "" | SELECT DisplayName, UserName, IsResource, DefaultPermission
    $CalendarItem.DisplayName = $Mailbox.DisplayName
    $CalendarItem.UserName = $Mailbox.UserPrincipalName
    $CalendarItem.IsResource = $Mailbox.IsResource
    $CalendarItem.DefaultPermission = $CalendarPermission.AccessRights[0].ToString()
    
    $CalendarList += $CalendarItem
}

Write-Host

$ExportDate = Get-Date
$CSVFileName = "CalendarDefaultPermissions_$($ExportDate.Year)_$("$($ExportDate.Month)".PadLeft(2,'0'))_$("$($ExportDate.Day)".PadLeft(2,'0')).txt"
Write-Host "Results have been written to: '$CSVFileName'"
$CalendarList | Export-CSV -Path $CSVFileName -NoTypeInformation