# Installs Google Earth Pro
$Installer = "$env:temp\GoogleEarthPro.exe"
$DownloadURL = "https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin.exe"

try {
  # Download Google Earth Pro
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Google Earth Pro
  Start-Process -Wait -Filepath $Installer -ArgumentList "OMAHA=1"

  # Remove Installer
  Remove-Item $Installer
} catch { throw $Error }
