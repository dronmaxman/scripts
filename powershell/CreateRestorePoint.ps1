<#
  .SYNOPSIS
    Creates a System Restore Point
  .DESCRIPTION
    Enables System Protection on all local drives and creates a System Restore Point.
  .EXAMPLE
    ./CreateRestorePoint.ps1 -Description 'Installed Quickbooks'
    ./CreateRestorePoint.ps1 -Force
#>

param (
  [string]$Description = 'Regular Checkpoint',
  [switch]$Force # Attempts to force a restore point
) 

$RegKey = 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore'
$RegProperty = 'SystemRestorePointCreationFrequency'
$RegValue = (Get-ItemProperty -Path $RegKey -Name $RegProperty -ErrorAction SilentlyContinue).$RegProperty

try {
  # Enable System Protection
  $LocalDrives = Get-WmiObject -Class 'Win32_LogicalDisk' | Where-Object { $_.DriveType -eq 3 } | Select-Object -ExpandProperty DeviceID
  Enable-ComputerRestore -Drive $LocalDrives

  # Create Checkpoint
  if ($Force) { Set-ItemProperty -Path $RegKey -Name $RegProperty -Value 0 }
  Checkpoint-Computer -Description $Description -RestorePointType MODIFY_SETTINGS
  if ($Force) {
    if ($RegValue) {
      Set-ItemProperty -Path $RegKey -Name $RegProperty -Value $RegValue
    }
    else {
      Remove-ItemProperty -Path $RegKey -Name $RegProperty
    }
  }
  Write-Output 'Checkpoint created.'
}
catch { throw $Error }
