# Downloads and installs fonts from a zip archive
Param (
  [Parameter(Mandatory=$true)]
  [ValidatePattern( "^(https)://" )]
  [System.Uri]$URL
)

$FontRegURL = '' # Add download link to FontReg here
$FontReg = "$env:temp\FontReg.exe"
$Archive = "$env:temp\Fonts.zip"
$Fonts = "$env:temp\Fonts"
$LocalFontStore = ($env:SystemRoot + '\Fonts\')

try {
  # Validate URL file extension
  if(!(([System.IO.Path]::GetExtension($URL.ToString())) -eq '.zip')){
    Write-Output 'Provided url did not link to a zip archive.'
    Exit
  }

  # Download necessary files & extract font archive
  Write-Output 'Downloading font archive...'
  Invoke-WebRequest -Uri $FontRegURL -OutFile $FontReg
  Invoke-WebRequest -Uri $URL -OutFile $Archive
  Expand-Archive -Path $Archive -DestinationPath $Fonts -Force

  # Verify archive contains supported fonts
  if((Get-ChildItem -Path $Fonts |  Where-Object { $_.extension -in '.ttf', '.ttc', '.otf' } | Measure-Object).Count -ne 0 ) {

    # Copy fonts to local font store
    Get-ChildItem $Fonts | Where-Object { $_.extension -in '.ttf', '.ttc', '.otf' } | Copy-Item -Destination $LocalFontStore -Force

    # Register fonts
    Write-Output 'Registering fonts...'
    Start-Process -Wait -Filepath $FontReg

  }else {
    Write-Output 'Archive did not contain supported font files (.ttf, .ttc, or .otf).'
  }
}
catch { throw $Error }
finally {
  # Clean up temp files
  Write-Output 'Cleaning up downloaded files...'
  Remove-Item $Archive, $Fonts, $FontReg -Recurse
}
