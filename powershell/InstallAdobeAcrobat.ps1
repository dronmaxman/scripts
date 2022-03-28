# Installs Adobe Acrobat DC
param (
  [ValidateScript({
      if ([System.IO.Path]::GetExtension($_) -eq '.zip') { $true }
      else { throw "`nThe Path parameter should be an accessible file path to the zip archive (.zip) containing the Adobe Acrobat installation files. Download link: https://helpx.adobe.com/acrobat/kb/acrobat-dc-downloads.html" }
    })]
  [System.IO.FileInfo]$Path # Optional local path to setup archive.
)

$Archive = "$env:temp\AdobeAcrobat.zip"
$Installer = "$env:temp\Adobe Acrobat\Setup.exe"
$DownloadURL = 'https://trials.adobe.com/AdobeProducts/APRO/Acrobat_HelpX/win32/Acrobat_DC_Web_WWMUI.zip'

try {
  # Download Setup Files
  if ($Path) {
    Copy-Item -Path $Path -Destination $Archive
  }
  else {
    Invoke-WebRequest -Uri $DownloadURL -OutFile $Archive
  }
  
  # Extract Installer
  Expand-Archive -Path $Archive -DestinationPath $env:temp -Force

  # Install Acrobat
  Start-Process -Wait -FilePath $Installer -ArgumentList '/sAll /rs /msi EULA_ACCEPT=YES'
}
catch { throw }
finally {
  # Remove Setup Files
  Remove-Item $Archive, "$env:temp\Adobe Acrobat\" -Recurse -Force -ErrorAction Ignore
}
