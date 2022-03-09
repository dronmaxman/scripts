# Installs Foxit Reader Enterprise
# Register here: https://www.foxit.com/pdf-reader/enterprise-register.html

param(
  [switch]$Default # Sets Foxit as the default PDF reader
)

$Installer = "$env:temp\FoxitReaderSetup.msi"
$DownloadURL = 'https://www.foxit.com/downloads/latest.html?product=Foxit-Enterprise-Reader&platform=Windows&package_type=msi&language=English'
if ($Default) { $DefaultValue = 1 } else { $DefaultValue = 0 }

# Installer Arguments
$ArgumentList = @(
  '/i',
  "$Installer",
  '/quiet',
  "MAKEDEFAULT=$DefaultValue",
  'DESKTOP_SHORTCUT=0',
  "LAUNCHCHECKDEFAULT=$DefaultValue",
  'AUTO_UPDATE=2',
  'DISABLE_UNINSTALL_SURVEY=1'
)

try {
  # Download Installer
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Program
  Start-Process -Wait msiexec -ArgumentList $ArgumentList
}
catch { throw }
finally {
  # Remove Installer
  Remove-Item $Installer -Force -ErrorAction Ignore
}
