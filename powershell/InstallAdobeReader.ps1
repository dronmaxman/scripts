# Installs Adobe Acrobat Reader DC
# Acquire a distribution license from Adobe here: http://www.adobe.com/products/reader/rdr_distribution1.html
# Once you have a valid license, you will have download links for Adobe Installers (without bloatware) for distribution.

$Installer = "$env:temp\AdobeReader.exe"
$DownloadURL = '' # Add download URL here

try {
  # Download Installer
  Invoke-WebRequest -Uri $DownloadURL -OutFile $Installer

  # Install Program
  Start-Process -Wait -FilePath $Installer -ArgumentList '/sAll /rs /msi EULA_ACCEPT=YES'
}
catch { throw }
finally {
  # Remove Installer
  Remove-Item $Installer -Force -ErrorAction Ignore
}
