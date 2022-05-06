# Manages Windows Defender & Windows Firewall via Local Group Policy

$ComputerPolicyFile = ($env:SystemRoot + '\System32\GroupPolicy\Machine\registry.pol')

Write-Output "`nChecking for necessary PowerShell modules..."
try {
  # Set PowerShell to TLS 1.2 (https://devblogs.microsoft.com/powershell/powershell-gallery-tls-support/)
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

  # Install NuGet package provider
  if (!(Get-PackageProvider -ListAvailable -Name 'NuGet' -ErrorAction Ignore)) {
    Write-Output 'Installing NuGet package provider...'
    Install-PackageProvider -Name 'NuGet' -MinimumVersion 2.8.5.201 -Force
  }

  # Set PSGallery to trusted repository
  Register-PSRepository -Default -InstallationPolicy 'Trusted' -ErrorAction Ignore
  if (!(Get-PSRepository -Name 'PSGallery' -ErrorAction Ignore).InstallationPolicy -eq 'Trusted') {
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Trusted'
  }
  
  # Install & Import PolicyFileEditor module
  if (!(Get-Module -ListAvailable -Name 'PolicyFileEditor' -ErrorAction Ignore)) {
    Write-Output 'Installing PolicyFileEditor module...'
    Install-Module -Name 'PolicyFileEditor'
    Import-Module 'PolicyFileEditor'
  }

  Write-Output 'Modules installed.'
}
catch { 
  throw $Error
  exit
}

$Policies = @(
  # SmartScreen Policies
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows\System'; ValueName = 'EnableSmartScreen'; Data = '1'; Type = 'Dword' } # Enable SmartScreen in Explorer
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows\System'; ValueName = 'ShellSmartScreenLevel'; Data = 'Warn'; Type = 'String' } # Set SmartScreen level in Explorer to Warn
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter'; ValueName = 'EnabledV9'; Data = '1'; Type = 'Dword' } # Enable SmartScreen in Microsoft Edge (Old)
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter'; ValueName = 'PreventOverride'; Data = '1'; Type = 'Dword' } # Prevent SmartScreen bypass in Microsoft Edge (Old)

  # Windows Defender Policies
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\UX Configuration'; ValueName = 'UILockdown'; Data = '0'; Type = 'Dword' } # Enable Defender AV UI
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender'; ValueName = 'PUAProtection'; Data = '1'; Type = 'Dword' } # Block potentially unwanted programs/apps
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender'; ValueName = 'DisableRoutinelyTakingAction'; Data = '0'; Type = 'Dword' } # Enable automated remediation
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'DisableRealtimeMonitoring'; Data = '0'; Type = 'Dword' } # Enable real-time protection
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'DisableBehaviorMonitoring'; Data = '0'; Type = 'Dword' } # Enable behavior monitoring
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'DisableInformationProtectionControl'; Data = '0'; Type = 'Dword' } # Enable information protection control
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'DisableIntrusionPreventionSystem'; Data = '0'; Type = 'Dword' } # Enable intrusion prevention system
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'DisableScanOnRealtimeEnable'; Data = '0'; Type = 'Dword' } # Scan when Defender is enabled
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'DisableOnAccessProtection'; Data = '0'; Type = 'Dword' } # Monitor file/program activity
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'DisableIOAVProtection'; Data = '0'; Type = 'Dword' } # Scan downloaded files/attachments
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'RealtimeScanDirection'; Data = '0'; Type = 'Dword' } # Monitor incoming/outgoing file activity
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'LocalSettingOverrideDisableOnAccessProtection'; Data = '0'; Type = 'Dword' } # Prevent disabling on access protection
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'LocalSettingOverrideRealtimeScanDirection'; Data = '0'; Type = 'Dword' } # Prevent disabling monitoring incoming/outgoing file activity
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'LocalSettingOverrideDisableIOAVProtection'; Data = '0'; Type = 'Dword' } # Prevent disabling scanning downloaded files
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'LocalSettingOverrideDisableBehaviorMonitoring'; Data = '0'; Type = 'Dword' } # Prevent disabling behavior monitoring
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'LocalSettingOverrideDisableIntrusionPreventionSystem'; Data = '0'; Type = 'Dword' } # Prevent disabling intrusion prevention system
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Real-Time Protection'; ValueName = 'LocalSettingOverrideDisableRealtimeMonitoring'; Data = '0'; Type = 'Dword' } # Prevent disabling real-time protection
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'CheckForSignaturesBeforeRunningScan'; Data = '1'; Type = 'Dword' } # Check for signature updates before scanning
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'LowCpuPriority'; Data = '1'; Type = 'Dword' } # Enable low CPU priority for scanning
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableRestorePoint'; Data = '0'; Type = 'Dword' } # Create a restore point prior to cleaning
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableArchiveScanning'; Data = '0'; Type = 'Dword' } # Scan archive files
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableScanningNetworkFiles'; Data = '0'; Type = 'Dword' } # Scan network files
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisablePackedExeScanning'; Data = '0'; Type = 'Dword' } # Scan packed executables
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableRemovableDriveScanning'; Data = '0'; Type = 'Dword' } # Scan removable drives
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'QuickScanInterval'; Data = '24'; Type = 'Dword' } # Enable daily quick scans
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'ScheduleDay'; Data = '1'; Type = 'Dword' } # Schedule scans on Sundays
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'ScanParameters'; Data = '2'; Type = 'Dword' } # Set scheduled scan type to full
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableCatchupFullScan'; Data = '0'; Type = 'Dword' } # Enable catch-up full scans
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableCatchupQuickScan'; Data = '0'; Type = 'Dword' } # Enable catch-up quick scans
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableEmailScanning'; Data = '0'; Type = 'Dword' } # Scan emails
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Scan'; ValueName = 'DisableHeuristics'; Data = '0'; Type = 'Dword' } # Enable heuristics
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Signature Updates'; ValueName = 'ForceUpdateFromMU'; Data = '1'; Type = 'Dword' } # Download updates from Microsoft Update
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Signature Updates'; ValueName = 'UpdateOnStartUp'; Data = '1'; Type = 'Dword' } # Update on startup
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Signature Updates'; ValueName = 'RealtimeSignatureDelivery'; Data = '1'; Type = 'Dword' } # Enable realtime signature update
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Spynet'; ValueName = 'SpynetReporting'; Data = '2'; Type = 'Dword' } # Join Microsoft MAPS
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Spynet'; ValueName = 'SubmitSamplesConsent'; Data = '1'; Type = 'Dword' } # Send safe file samples to MAPS
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access'; ValueName = 'EnableControlledFolderAccess'; Data = '2'; Type = 'Dword' } # Enable Controlled Folder Access (audit)
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection'; ValueName = 'EnableNetworkProtection'; Data = '1'; Type = 'Dword' } # Block dangerous websites

  # Windows Defender Firewall Policies
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\WindowsFirewall\DomainProfile'; ValueName = 'EnableFirewall'; Data = '1'; Type = 'Dword' } # Enable Domain profile
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging'; ValueName = 'LogDroppedPackets'; Data = '1'; Type = 'Dword' } # Enable Domain profile dropped packet logging
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\WindowsFirewall\PrivateProfile'; ValueName = 'EnableFirewall'; Data = '1'; Type = 'Dword' } # Enable Private profile
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging'; ValueName = 'LogDroppedPackets'; Data = '1'; Type = 'Dword' } # Enable Private profile dropped packet logging
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\WindowsFirewall\PublicProfile'; ValueName = 'EnableFirewall'; Data = '1'; Type = 'Dword' } # Enable Public profile
  [PSCustomObject]@{Key = 'Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging'; ValueName = 'LogDroppedPackets'; Data = '1'; Type = 'Dword' } # Enable Public profile dropped packet logging
)

try {
  Write-Output "`nSetting security policies..."
  $Policies | Set-PolicyFileEntry -Path $ComputerPolicyFile -ErrorAction Stop
  Write-Output "Security policies set.`n"

  # Set Auditing Policies
  Write-Output 'Setting auditing policies...'
  Auditpol /set /category:"Logon/Logoff" /Success:enable /Failure:enable | Out-Null
  Auditpol /set /category:"Account Logon" /Success:enable /Failure:enable | Out-Null
  Auditpol /set /category:"Account Management" /Success:enable /Failure:enable | Out-Null
  Auditpol /set /category:"DS Access" /Failure:enable | Out-Null
  Auditpol /set /category:"System" /Failure:enable | Out-Null
  Write-Output 'Auditing policies set.`n'

  # Update Policies
  gpupdate /force /wait:0
}
catch { throw $Error }
