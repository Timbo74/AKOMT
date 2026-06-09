# Defender

## Defender Guard / ASR Rules

Temp exclusion to defender guard / ASR rules
```
Add-MpPreference -AttackSurfaceReductionOnlyExclusions "C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing"
Add-MpPreference -ExclusionPath "C:\Path\to\folder"
```

To revert use ```Remove-MpPreference``` with the same paths.

```
Remove-MpPreference -AttackSurfaceReductionOnlyExclusions "C:\Program Files (x86)\Common Files\Autodesk Shared\AdskLicensing"
Remove-MpPreference -ExclusionPath "C:\Path\to\folder"
```
