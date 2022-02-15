# Installs Splashtop for RMM Viewer
$Installer = "$env:Temp\SplashtopViewer.exe"
$DownloadURL = '' # Add download URL from your RMM provider here

try {
  # Download Splashtop for RMM Viewer
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Splashtop for RMM Viewer
  Start-Process -Wait -FilePath $Installer -ArgumentList 'prevercheck /s /i'

  # Trust Splashtop RMM URL File Handler in Chrome & Edge (Chromium)
  Reg.exe add 'HKLM\SOFTWARE\Policies\Google\Chrome\URLWhitelist' /v '200' /t REG_SZ /d 'st-rmm://*' /f
  Reg.exe add 'HKLM\SOFTWARE\Policies\Microsoft\Edge\URLAllowlist' /v '200' /t REG_SZ /d 'st-rmm://*' /f
}
catch { throw $Error }
finally {
  # Remove Installer / Shortcut
  Remove-Item $Installer -Force -ErrorAction Ignore
  Remove-Item "$env:Public\Desktop\Splashtop for RMM.lnk" -Force -ErrorAction Ignore
}
