param(
    [Parameter(Mandatory = $true, Position = 0,
               HelpMessage = "Path(s) to rclone lsjson file(s). Wildcards and multiple paths OK.")]
    [string[]]$JsonFiles,
    [switch]$AllFolders      # report every top-level folder, ignoring the 01-12 filter
)

# ==========================================================================
#  SharePoint Folder Statistics — from rclone lsjson file(s)
#  Generate manually, then run:
#    .\sp_folder_statistics.ps1 .\testreport.json
#    .\sp_folder_statistics.ps1 .\testreport.json -AllFolders
# ==========================================================================

# ── CONFIG ──────────────────────────────────────────────────────────────
$CsvPath             = "C:\Reports\FolderStats_rclone.csv"
$OnlyNumberedFolders = $true      # ignored if -AllFolders is passed
$NumberedNames       = 1..12 | ForEach-Object { $_.ToString("00") }
$LabelOverrides      = @{}
if ($AllFolders) { $OnlyNumberedFolders = $false }

# ── RESOLVE INPUT FILES ─────────────────────────────────────────────────
$allMatched = @()
foreach ($f in $JsonFiles) {
    $found = @(Get-Item $f -ErrorAction SilentlyContinue |
               Where-Object { -not $_.PSIsContainer })
    if ($found.Count -eq 0) { Write-Warning "No file matched '$f' — skipped." }
    $allMatched += $found
}
$inputFiles = @($allMatched | Sort-Object FullName -Unique)
if ($inputFiles.Count -eq 0) { Write-Error "No valid JSON files supplied."; exit 1 }

# ── MAIN ────────────────────────────────────────────────────────────────
$Results = @()

foreach ($file in $inputFiles) {

    $label = if ($LabelOverrides.ContainsKey($file.BaseName)) { $LabelOverrides[$file.BaseName] }
             else                                             { $file.BaseName }

    Write-Host "`n━━━ $label  ($($file.Name)) ━━━" -ForegroundColor Cyan

    try {
        $all = @(Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json -ErrorAction Stop)
    } catch {
        Write-Warning "Not valid JSON — skipping '$($file.Name)': $($_.Exception.Message)"
        continue
    }
    if ($all.Count -eq 0) {
        Write-Warning "No entries in '$($file.Name)' — empty listing?"
        continue
    }

    # Shape check: must be lsjson entries (Path/Size/IsDir), not e.g. 'rclone size --json' output
    $props = $all[0].PSObject.Properties.Name
    if (-not ($props -contains 'Path')) {
        Write-Warning "'$($file.Name)' doesn't look like rclone lsjson output (no 'Path' field)."
        Write-Host  "  Regenerate with:  rclone lsjson `"RemoteName:`" -R --no-mimetype --no-modtime | Set-Content <file>.json" -ForegroundColor Yellow
        continue
    }

    $dirCount  = @($all | Where-Object IsDir).Count
    $fileCount = $all.Count - $dirCount
    Write-Host ("  Entries: {0}  (folders: {1}, files: {2})" -f $all.Count, $dirCount, $fileCount) -ForegroundColor DarkGray

    # Index every entry under its parent path
    $children = @{}
    foreach ($e in $all) {
        $p      = [string]$e.Path
        $parent = if ($p.Contains('/')) { $p.Substring(0, $p.LastIndexOf('/')) } else { '' }
        if (-not $children.ContainsKey($parent)) {
            $children[$parent] = [System.Collections.Generic.List[object]]::new()
        }
        $children[$parent].Add($e)
    }

    # Loose files directly in the library root (FYI only)
    $rootFiles = @($children[''] | Where-Object { -not $_.IsDir })
    $sum = ($rootFiles | Measure-Object -Property Size -Sum).Sum
    $rootBytes = if ($null -ne $sum) { [long]$sum } else { 0 }
    Write-Host ("  Files directly in library root: {0} ({1:N2} MB)" -f $rootFiles.Count, ($rootBytes / 1MB)) -ForegroundColor DarkGray

    # Top-level folders
    $allTop  = @($children[''] | Where-Object { $_.IsDir })
    $topDirs = if ($OnlyNumberedFolders) { @($allTop | Where-Object { $_.Name -in $NumberedNames }) }
               else                      { @($allTop | Where-Object { $_.Name -ne 'Forms' }) }

    if ($topDirs.Count -eq 0) {
        Write-Warning "No top-level folders matched in '$($file.Name)'."
        $names = if ($allTop.Count) { $allTop.Name -join ', ' } else { '(none found)' }
        Write-Host "  Top-level folders actually present: $names" -ForegroundColor Yellow
        if ($OnlyNumberedFolders) {
            Write-Host "  Filter expects exactly: $($NumberedNames -join ', ')" -ForegroundColor Yellow
            Write-Host "  → re-run with -AllFolders to report every top-level folder." -ForegroundColor Yellow
        }
        continue
    }

    foreach ($tf in ($topDirs | Sort-Object Name)) {

        $files = 0; $dirs = 0; $maxDepth = 0; $bytes = [long]0
        $topLevels = ($tf.Path -split '/').Count
        $stack = [System.Collections.Stack]::new()
        $stack.Push($tf.Path)

        while ($stack.Count) {
            $cur = $stack.Pop()
            foreach ($c in $children[$cur]) {
                if ($c.IsDir) {
                    $dirs++
                    $d = ($c.Path -split '/').Count - $topLevels
                    if ($d -gt $maxDepth) { $maxDepth = $d }
                    $stack.Push($c.Path)
                }
                else {
                    $files++
                    $bytes += [long]$c.Size
                }
            }
        }

        $Results += [PSCustomObject]@{
            SourceFile      = $file.Name
            Library         = $label
            Folder          = $tf.Name
            FileCount       = $files
            FolderCount     = $dirs
            MaxNestingDepth = $maxDepth
            SizeBytes       = $bytes
            SizeMB          = [Math]::Round($bytes / 1MB, 2)
            SizeGB          = [Math]::Round($bytes / 1GB, 2)
        }
    }
}

# ── OUTPUT ──────────────────────────────────────────────────────────────
if ($Results.Count -eq 0) {
    Write-Warning "No rows produced — CSV not written. See the yellow diagnostics above."
    return
}

$Results | Format-Table -AutoSize

$dir = Split-Path $CsvPath -Parent
if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
$Results | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8
Write-Host "`n✅ Report saved to: $CsvPath ($($Results.Count) rows)" -ForegroundColor Green
