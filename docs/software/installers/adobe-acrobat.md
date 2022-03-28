---
description: PowerShell script to silently install Adobe Acrobat DC.
---

# Adobe Acrobat

## Overview

This script will silently install Adobe Acrobat DC. A path to the setup files (.zip archive) can be provided to save bandwidth. If no path is specified, the setup files will be downloaded directly from Adobe.

{% embed url="https://helpx.adobe.com/acrobat/kb/acrobat-dc-downloads.html" %}

**Optional Steps for Local Deployment:**&#x20;

1. Download the Adobe Acrobat setup files from the link above
2. Save the setup archive to a local share
3. Deploy via RMM with the `-Path` parameter specifying the local path to the archive

## Script

**Usage:** `.\InstallAdobeAcrobat.ps1 -Path \\share\AdobeAcrobat.zip`

{% embed url="https://gist.github.com/wise-io/4e3247f74f734e1e061170e80987221c" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://www.adobe.com/devnet-docs/acrobatetk/tools/DesktopDeployment/cmdline.html" %}

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

**Cmdlet Documentation:**

* [Copy-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/copy-item?view=powershell-5.1)
* [Expand-Archive](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/expand-archive?view=powershell-5.1)
* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.2)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.2)
