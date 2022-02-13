# Removes Apple QuickTime
$Paths = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall', 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
$App = Get-ChildItem -Path $Paths | Get-ItemProperty | Where-Object { $_.DisplayName -match 'quicktime' } | Select-Object -Property DisplayName, UninstallString

foreach ($Ver in $App) {
  if ($Ver.UninstallString) {
    $DisplayName = $Ver.DisplayName
    $Uninst = $Ver.UninstallString -replace '/I', '/x '
    Write-Output "Uninstalling $DisplayName..."
    cmd /c $Uninst /qn
  }
}
