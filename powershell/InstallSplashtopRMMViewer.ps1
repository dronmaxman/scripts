# Installs Splashtop for RMM Viewer
$Installer = "$env:Temp\SplashtopViewer.exe"
$DownloadURL = '' # Add download URL from your RMM provider here
$FileHandlerPrefix = 'st-rmm://*'
$RegValue = '200' 

try {
  # Download Splashtop for RMM Viewer
  Write-Output 'Downloading Splashtop for RMM viewer...'
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Splashtop for RMM Viewer
  Write-Output 'Installing Splashtop for RMM viewer...'
  Start-Process -Wait -FilePath $Installer -ArgumentList 'prevercheck /s /i'

  # Trust Splashtop RMM URL File Handler in Chrome & Edge (Chromium)
  Reg.exe add 'HKLM\SOFTWARE\Policies\Google\Chrome\URLWhitelist' /v $RegValue /t REG_SZ /d $FileHandlerPrefix /f | Out-Null
  Reg.exe add 'HKLM\SOFTWARE\Policies\Microsoft\Edge\URLAllowlist' /v $RegValue /t REG_SZ /d $FileHandlerPrefix /f | Out-Null
}
catch { throw $Error }
finally {
  # Remove Installer / Shortcut
  Remove-Item $Installer -Force -ErrorAction Ignore
  Remove-Item "$env:Public\Desktop\Splashtop for RMM.lnk" -Force -ErrorAction Ignore
}
