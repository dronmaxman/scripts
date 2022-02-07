<#
  .SYNOPSIS
    Installs Microsoft Office with ODT (Office Deployement Tool)
  .DESCRIPTION
    This script downloads ODT to download/install Microsoft Office with the provided configuration file.
  .EXAMPLE
    ./InstallOffice.ps1 -Config "https://example.com/linktoconfig.xml" -download
  .LINK
    ODT Download: https://www.microsoft.com/en-us/download/details.aspx?id=49117
    XML Configuration Generator: https://config.office.com/
#>

Param(
  [Parameter (Mandatory=$true)]
  [String]$Config, # Link to configuration xml file
  [Switch]$Download # Downloads Office if set
)

$DeploymentToolDownloadURL = '' # Host ODT at a trusted location
$DeploymentTool = "$env:temp\office-deployment-tool.exe"
$ConfigFile = "$env:temp\office-config.xml"

try {
  # Download Office Deployment Tool & Configuration File
  Invoke-WebRequest -Uri $DeploymentToolDownloadURL -OutFile $DeploymentTool
  Invoke-WebRequest -Uri $Config -OutFile $ConfigFile

  # Download Office If Requested
  if($Download) {
    Write-Output 'Downloading Microsoft Office installation files...'
    Start-Process -Wait -Filepath $DeploymentTool -ArgumentList "/download $ConfigFile"
  }

  # Install Office
  Write-Output 'Installing Microsoft Office...'
  Start-Process -Wait -Filepath $DeploymentTool -ArgumentList "/configure $ConfigFile"
} catch { throw $Error }
