<#
  .SYNOPSIS
    Clears (resets) local group policies.
  .DESCRIPTION
    Clears (resets) local group policies by deleting registry.pol and associated files.
    Warning: this script will result in the loss of existing local policies.
  .EXAMPLE
    ./ResetLocalPolicies.ps1 -Reboot
#>

Param ([switch]$Reboot)

# Clear existing local policies
Write-Output "Resetting local policies..."

# Clears policy files
$PolicyFiles = $env:SystemRoot + '\System32\GroupPolicy'
Remove-Item -Path $PolicyFiles -Recurse -Force -ErrorAction Ignore

# Clears user specific policy files
$UserPolicyFiles = $env:SystemRoot + '\System32\GroupPolicyUsers'
Remove-Item -Path $UserPolicyFiles -Recurse -Force -ErrorAction Ignore

# Apply new policies
gpupdate /force /wait:0

# Prompt for reboot
if ($Reboot) {
  shutdown -r -t 120 -c "Local group policies have been cleared. Your computer will reboot in 2 minutes. Please save and close your work."
}
