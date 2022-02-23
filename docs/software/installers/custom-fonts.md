---
description: PowerShell script to silently download and install fonts from a zip archive.
---

# Custom Fonts

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written to deploy custom fonts required by an accounting software vendor. It uses a third-party utility called [FontReg](http://code.kliu.org/misc/fontreg/).
{% endhint %}

**Prerequisites:**

1. Gather necessary font files (`.ttf`, `.ttc`, or `.otf`)
2. Compress fonts into an archive (.zip)
3. Download [**FontReg**](http://code.kliu.org/misc/fontreg/)****
4. Upload archive & FontReg.exe to your preferred file host
5. Insert the url to download FontReg.exe on `line 8` of the script below
6. Deploy via your RMM solution

## Script

{% hint style="info" %}
**Note:** To help prevent abuse, this script will only move font files with the `.ttf`, `.ttc`, or `.otf` file extensions to the Local Font Store. Custom fonts will need to be one of these types in order to be installed.
{% endhint %}

**Usage:** `.\InstallFonts.ps1 -URL https://example.com/fonts.zip`

{% embed url="https://gist.github.com/wise-io/33d424b5c9b766eb45d1a70c170376e2" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="http://code.kliu.org/misc/fontreg" %}

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

**Cmdlet Documentation:**

* [Expand-Archive](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/expand-archive?view=powershell-7.2)
* [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.2)
* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [Measure-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/measure-object?view=powershell-7.2)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.2)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.2)
* [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
