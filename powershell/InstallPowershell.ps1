# Installs PowerShell v7
param(
  [switch]$x86 # Installs 32-bit PowerShell regardless of architecture
) 

if ($x86) { $Architecture = 'x86' }
else {
  switch ($env:PROCESSOR_ARCHITECTURE) {
    'AMD64' { $Architecture = 'x64' }
    'x86' { $Architecture = 'x86' }
    default { throw "PowerShell package for OS architecture '$_' is not supported." }
  }
}

try {

  # Get latest PowerShell version information
  $Metadata = Invoke-RestMethod 'https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/metadata.json'
  $Release = $Metadata.ReleaseTag -replace '^v'
  $PackageName = "PowerShell-${Release}-win-${Architecture}.msi"
  $DownloadURL = "https://github.com/PowerShell/PowerShell/releases/download/v${Release}/${PackageName}"
  $PackagePath = "$env:temp\$PackageName"

  # Download PowerShell package
  Write-Output "`nDownloading PowerShell from:`n$DownloadURL"
  Invoke-WebRequest -Uri $DownloadURL -OutFile $PackagePath

  # Install PowerShell
  Write-Output "`nInstalling $PackageName..."
  msiexec.exe /i $PackagePath /quiet USE_MU=1 ENABLE_MU=1
}
catch { throw $Error }
finally { Remove-Item $PackagePath -Force -ErrorAction Ignore }
