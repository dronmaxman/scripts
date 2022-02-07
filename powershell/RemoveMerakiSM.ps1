# Removes Meraki Systems Manager Agent
$App = Get-ChildItem -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ | Get-ItemProperty | Where-Object {$_.DisplayName -like "Meraki Systems Manager Agent" } | Select-Object -Property DisplayName, UninstallString

ForEach ($Ver in $App) {
  If ($Ver.UninstallString) {
    $DisplayName = $Ver.DisplayName
    $Uninst = $Ver.UninstallString
    Write-Output "Uninstalling $DisplayName..."
    cmd /c $Uninst /qn
  }
}
