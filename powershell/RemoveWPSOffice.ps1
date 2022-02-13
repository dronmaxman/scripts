# Removes WPS (Kingsoft) Office User Based Installs
$App = Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.Publisher -like 'Kingsoft*' } | Select-Object -Property DisplayName, UninstallString

foreach ($Ver in $App) {
  if ($Ver.UninstallString) {
    $DisplayName = $Ver.DisplayName
    $Uninst = $Ver.UninstallString
    Write-Output "Uninstalling $DisplayName..."
    cmd /c $Uninst /s
  }
}
