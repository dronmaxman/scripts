# Removes LibreOffice Installations (x32 & x64)
$Paths = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall', 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
$App = Get-ChildItem -Path $Paths | Get-ItemProperty | Where-Object { $_.DisplayName -like 'LibreOffice*' } | Select-Object

foreach ($Ver in $App) {
  if ($Ver.UninstallString) {
    $DisplayName = $Ver.DisplayName
    $Uninst = $Ver.PSChildName
    Write-Output "Uninstalling $DisplayName..."
    cmd /c msiexec.exe /qn /uninstall $Uninst
  }
}
