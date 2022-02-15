---
description: PowerShell script to silently install the latest version of PowerShell.
---

# PowerShell

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written to make utilizing other PowerShell scripts that rely on newer versions of PowerShell easier.
{% endhint %}

This script will install the latest version of PowerShell and allow Windows Update to keep it updated. By default, the script will install the PowerShell version matching the system architecture, but the `-x86` switch parameter can be used to install 32-bit PowerShell on 64-bit systems.

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

{% embed url="https://github.com/PowerShell/PowerShell" %}

## Script

**Example Usage:** `.\InstallPowerShell.ps1 -x86`

{% embed url="https://gist.github.com/wise-io/00e5676cd0858ea853c8dde667510165" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec" %}

**Cmdlet Documentation:**

* [Invoke-RestMethod​](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-restmethod?view=powershell-5.1)
* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-5.1)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-5.1)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-5.1)
