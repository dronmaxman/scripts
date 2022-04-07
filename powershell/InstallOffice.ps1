<#
  .SYNOPSIS
    Installs Microsoft Office with ODT (Office Deployement Tool)
  .DESCRIPTION
    This script downloads ODT to download/install Microsoft Office with the provided configuration file.
  .EXAMPLE
    ./InstallOffice.ps1 -Config "https://example.com/linktoconfig.xml" -download
  .LINK
    XML Configuration Generator: https://config.office.com/
#>

param(
  [Parameter (Mandatory = $true)]
  [string]$Config, # Link to configuration xml file
  [switch]$Download # Downloads Office if set
)

$ODTDownloadURL = 'https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_14931-20120.exe'
$ODTSetup = "$env:temp\ODTSetup.exe"
$ODT = "$env:temp\ODT\"
$ConfigFile = "$env:temp\ODT\office-config.xml"

try {
  # Download Office Deployment Tool
  Write-Output 'Downloading Office Deployment Tool (ODT)...'
  Invoke-WebRequest -Uri $ODTDownloadURL -OutFile $ODTSetup
  
  # Extract ODT Files
  Write-Output 'Extracting ODT...'
  Start-Process -Wait -NoNewWindow -FilePath $ODTSetup -ArgumentList "/extract:$ODT /quiet"

  # Download Configuration File
  Invoke-WebRequest -Uri $Config -OutFile $ConfigFile

  # Download Office If Requested
  if ($Download) {
    Write-Output 'Downloading Microsoft Office installation files...'
    Start-Process -Wait -FilePath "$ODT\setup.exe" -ArgumentList "/download $ConfigFile"
  }

  # Install Office
  Write-Output 'Installing Microsoft Office...'
  Start-Process -Wait -FilePath "$ODT\setup.exe" -ArgumentList "/configure $ConfigFile"
}
catch { throw $Error }
finally {
  # Remove Setup Files
  Remove-Item $ODT, $ODTSetup -Recurse -Force -ErrorAction Ignore
}
