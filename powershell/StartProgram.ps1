<#
  .SYNOPSIS
    Starts the specified program.
  .DESCRIPTION
    Starts a program if it is not already running.
  .EXAMPLE
    ./StartProgram.ps1 -Path "C:\WINDOWS\system32\notepad.exe"
#>

param (
  [Parameter(Mandatory = $true)]
  [ValidateScript({
      if ( -Not ($_ | Test-Path) ) { throw "Cannot find $_." }
      return $true
    })]
  [System.IO.FileInfo]$Path,        # Path to executable
  [Alias('Args', 'Arguments', 'Parameters')]
  [string[]]$ArgumentList = @(' '), # String or comma-separated list of arguments
  [switch]$Force,                   # Attempt to start executable even when already running (can start multiple instances)
  [switch]$Restart                  # Restarts executable if already running
)

# Get the process name
$ProcessName = [System.IO.Path]::GetFileNameWithoutExtension($Path)

if ($Force) {
  Write-Output "Starting $ProcessName..."
  Start-Process -FilePath $Path -ArgumentList @ArgumentList
}
else {
  # Check if program is running
  $Running = Get-Process $ProcessName -ErrorAction SilentlyContinue

  # Start or restart program
  if ($Running) { 
    if ($Restart) {
      Write-Output "Stopping $ProcessName..."
      Stop-Process -Name $ProcessName
      Wait-Process -Name $ProcessName -Timeout 30
      Write-Output "Starting $ProcessName..."
      Start-Process -FilePath $Path -ArgumentList @ArgumentList
    }
    else {
      Write-Output "The $ProcessName process was already running."
    }
  }
  else {
    Write-Output "The $ProcessName process was not running. Starting $ProcessName..."
    Start-Process -FilePath $Path -ArgumentList @ArgumentList
  }
}
