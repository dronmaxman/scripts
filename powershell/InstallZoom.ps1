# Installs Zoom Meetings
$Installer = "$env:temp\ZoomInstallerFull.msi"
$DownloadURL = 'https://www.zoom.us/client/latest/ZoomInstallerFull.msi'

try {
  # Download Zoom Meetings
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Zoom Meetings
  msiexec.exe /i $Installer ALLUSERS=1 /quiet /qn /norestart ZoomAutoUpdate="true"
}
catch { throw $Error }
