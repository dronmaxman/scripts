# Manage Windows Defender Exclusions

param (
  [switch]$Audit,     # Audit exclusions
  [string[]]$ASR,     # Exclude files/paths from ASR rules
  [string[]]$Ext,     # Exclude file extensions (Example: exe, txt, pdf)
  [string[]]$IP,      # Exclude IP addresses
  [string[]]$Path,    # Exclude paths
  [string[]]$Process, # Exclude processes
  [switch]$Remove     # Remove exclusions
)

# Format paramaters for RMMs that don't accept multiple values to PowerShell array parameters, such as NinjaOne
if ($ASR -and $ASR[0] -like '*,*') { $ASR = ($ASR[0] -replace "'", '') -split ',' }
if ($Ext -and $Ext[0] -like '*,*') { $Ext = ($Ext[0] -replace "'", '') -split ',' }
if ($IP -and $IP[0] -like '*,*') { $IP = ($IP[0] -replace "'", '') -split ',' }
# Note: This unforunately breaks compatibility with paths that include a comma, so it has been commented out
# if ($Path -and $Path[0] -like '*,*') { $Path = ($Path[0] -replace "'", '') -split ',' }
if ($Process -and $Process[0] -like '*,*') { $Process = ($Process[0] -replace "'", '') -split ',' }

if ($Remove) {
  # Remove Exclusions
  if ($ASR) { Remove-MpPreference -AttackSurfaceReductionOnlyExclusions $ASR }
  if ($Ext) { Remove-MpPreference -ExclusionExtension $Ext }
  if ($IP) { Remove-MpPreference -ExclusionIpAddress $IP }
  if ($Path) { Remove-MpPreference -ExclusionPath $Path }
  if ($Process) { Remove-MpPreference -ExclusionProcess $Process }
}
else {
  # Add exclusions
  if ($ASR) { Add-MpPreference -AttackSurfaceReductionOnlyExclusions $ASR }
  if ($Ext) { Add-MpPreference -ExclusionExtension $Ext }
  if ($IP) { Add-MpPreference -ExclusionIpAddress $IP }
  if ($Path) { Add-MpPreference -ExclusionPath $Path }
  if ($Process) { Add-MpPreference -ExclusionProcess $Process }
}

if ($Audit -Or $PSBoundParameters.Values.Count -eq 0) {
  
  # Set Header
  $Output = "`nCurrent Exclusions`n------------------`n"

  # Set Properties
  $Properties = @(
    @{Name = 'ASR'; Expression = { $_.AttackSurfaceReductionOnlyExclusions } },
    @{Name = 'Extension'; Expression = { $_.ExclusionExtension } },
    @{Name = 'IP Address'; Expression = { $_.ExclusionIpAddress } },
    @{Name = 'Path'; Expression = { $_.ExclusionPath } },
    @{Name = 'Process'; Expression = { $_.ExclusionProcess } }
  )

  # Retrieve Exclusions
  $Output += (Get-MpPreference | Select-Object $Properties | Format-List | Out-String).Trim() + "`n"

  # Output Results
  Write-Output $Output
}
