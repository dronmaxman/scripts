# Initiates Microsoft Office updates
$Path = 'C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe'
$Arguments = '/update user'

# Get the process name
$ProcessName = [System.IO.Path]::GetFileNameWithoutExtension($Path)

# Check if Microsoft Office updates are running
$Running = Get-Process $ProcessName -ErrorAction SilentlyContinue

# If not running, start Microsoft Office updates
if (!$Running) { 
  Write-Output 'Starting Microsoft Office update process...'
  Start-Process -FilePath $Path -ArgumentList $Arguments
}
else { 
  Write-Output 'The Microsoft Office update process is currently running.'
}
