# Installs Microsoft Teams (Machine-Wide)
param(
  [switch]$x86 # Attempts to install 32-bit Teams regardless of architecture
) 

# Determine architecture
if ($x86) { $Arch = 'x86' }
else {
  switch ($env:PROCESSOR_ARCHITECTURE) {
    'AMD64' { $Arch = 'x64' }
    'x86' { $Arch = 'x86' }
    'ARM64' { $Arch = 'arm64' }
    default { throw "Teams package for OS architecture '$_' is not supported." }
  }
}

$Installer = "$env:Temp\Teams_windows_$Arch.msi"
$DownloadURL = "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=$Arch&managedInstaller=true&download=true"

try {
  # Download Microsoft Teams
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Microsoft Teams
  Start-Process -Wait msiexec -ArgumentList "/i $Installer OPTIONS=`"noAutoStart=true`" ALLUSERS=1"
}
catch { throw $Error }
finally { Remove-Item $Installer -Force -ErrorAction Ignore }
