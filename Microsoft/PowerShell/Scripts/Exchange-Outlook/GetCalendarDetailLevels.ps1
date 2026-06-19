Connect-ExchangeOnline

Write-Host "Getting mailboxes..." -NoNewline
$Mailboxes = Get-Mailbox -ResultSize 2000 | Select-Object -Property DisplayName, UserPrincipalName | Sort-Object -Property DisplayName
Write-Host " done."

$CalendarList = @()

Write-Host "Checking Calendar settings..."
foreach($Mailbox in $Mailboxes)
{
    $CalendarFolderName = $Mailbox.UserPrincipalName + ":\Calendar"
    Write-Host "Checking: $($Mailbox.DisplayName) [$CalendarFolderName]"
    $CalendarFolder = Get-MailboxCalendarFolder -Identity $CalendarFolderName

    $CalendarItem = "" | SELECT DisplayName, UserName, DetailLevel
    $CalendarItem.DisplayName = $Mailbox.DisplayName
    $CalendarItem.UserName = $Mailbox.UserPrincipalName
    $CalendarItem.DetailLevel = $CalendarFolder.DetailLevel
    
    $CalendarList += $CalendarItem
}

$ExportDate = Get-Date
$CSVFileName = "CalendarDetailLevels_$($ExportDate.Year)_$("$($ExportDate.Month)".PadLeft(2,'0'))_$("$($ExportDate.Day)".PadLeft(2,'0')).txt"

Write-Host "Results have been written to: '$CSVFileName'"
$CalendarList | Export-CSV -Path $CSVFileName -NoTypeInformation