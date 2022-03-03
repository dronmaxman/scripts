# Installs Google Earth Pro
$Installer = "$env:temp\GoogleEarthPro.exe"
$DownloadURL = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin.exe'

try {
  # Download Google Earth Pro
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Google Earth Pro
  Start-Process -Wait -FilePath $Installer -ArgumentList 'OMAHA=1'
}
catch { throw }
finally {
  # Remove Installer
  Remove-Item $Installer -Force -ErrorAction Ignore
}
