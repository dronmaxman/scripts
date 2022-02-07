---
description: PowerShell script to initiate an update of Microsoft Office products.
---

# Update Office

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written as part of a bundle of scripts to help automate and manage Microsoft Office deployments by keeping them up to date.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% hint style="info" %}
**Note:** Need to update Microsoft Office on MacOS? [See here](https://docs.microsoft.com/en-us/deployoffice/mac/update-office-for-mac-using-msupdate).
{% endhint %}

{% code title="UpdateOffice.ps1" %}
```powershell
# Initiates Microsoft Office updates
$Path = "C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe"
$Arguments = "/update user"

# Get the process name
$ProcessName = [System.IO.Path]::GetFileNameWithoutExtension($Path)

# Check if Microsoft Office updates are running
$Running = Get-Process $ProcessName -ErrorAction SilentlyContinue

# If not running, start Microsoft Office updates
If (!$Running) { 
  Write-Output 'Starting Microsoft Office update process...'
  Start-Process -FilePath $Path -ArgumentList $Arguments
}Else { 
  Write-Output 'The Microsoft Office update process is currently running.'
}

```
{% endcode %}

**Simple Batch Script Alternative:**

{% embed url="https://gist.github.com/wise-io/f91f2f6ff72f5b0d9459f2994ae61c0d" %}

{% code title="UpdateOffice.bat" %}
```batch
"C:\Program Files\Common Files\Microsopsft Shared\ClickToRun\OfficeC2RClient.exe" /update user
```
{% endcode %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% hint style="info" %}
**Note:** Unfortunately, the [official documentation link](https://docs.microsoft.com/en-us/archive/blogs/odsupport/the-new-update-now-feature-for-office-2013-click-to-run-for-office365-and-its-associated-command-line-and-switches/) for **OfficeC2RClient.exe** is broken. Here is a [link to an archived version](https://web.archive.org/web/20190420045307/https://blogs.technet.microsoft.com/odsupport/2014/03/03/the-new-update-now-feature-for-office-2013-click-to-run-for-office365-and-its-associated-command-line-and-switches/).
{% endhint %}

**Cmdlet Documentation:**

* [Get-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-7.2)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
