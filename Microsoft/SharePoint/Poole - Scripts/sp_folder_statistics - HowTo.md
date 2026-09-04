# sp_folder_statistics.ps1

Requires: PowerShell 7

Once you've setup an rclone config for a sharepoint library.

```powershell
.\rclone lsjson "rclone_config:" -R --no-mimetype --no-modtime | set-content "C:\Reports\reportname.json" -Encoding utf8
```
Then you can feed that into the script like so:

```powershell
.\sp_folder_statistics.ps1 -AllFolders .\testreport.json
```

And it will generate a csv.

```plaintext
PS C:\Reports> .\sp_folder_statistics.ps1 -AllFolders .\testreport.json

━━━ testreport  (testreport.json) ━━━
  Entries: 114255  (folders: 17066, files: 97189)
  Files directly in library root: 0 (0.00 MB)

SourceFile      Library    Folder                                FileCount FolderCount MaxNestingDepth    SizeBytes Siz
                                                                                                                    eMB
----------      -------    ------                                --------- ----------- ---------------    --------- ---
testreport.json testreport 01. Registers                                45           8               3     15214484 …51
testreport.json testreport 02. Administration                        19945        2222              10  74659459717 …81
testreport.json testreport 03. Estimating                            48885        7468              12 172374952554…57
testreport.json testreport 04. IMS                                    8243        2106              10  27417530026 …39
testreport.json testreport 06. Traffic Management                      240          51               5   1778541948 …15
testreport.json testreport 07. Plant & Equipment                      7111        2674               8  12973255690 …26
testreport.json testreport 09. Avard Depot - 132 Strickland Road        46          35               3     23184022 …11
testreport.json testreport 10. Terms & Conditions                        5           1               1      1538577 …47
testreport.json testreport 11. IT Systems                             7000         652               8  13422482825 …68
testreport.json testreport 12. Fox Stabilising Pty Ltd                5669        1839               9  12686721216 …00


✅ Report saved to: C:\Reports\FolderStats_rclone.csv (10 rows)
```


