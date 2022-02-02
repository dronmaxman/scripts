---
description: PowerShell script to silently uninstall Apple QuickTime (x32 & x64).
---

# QuickTime

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written to help organizations reduce their attack surface by removing Apple QuickTime, mitigating multiple known vulnerabilities.
{% endhint %}

On April 14th, 2016, the [CISA](https://www.cisa.gov) recommended the uninstallation of QuickTime on Windows computers due to multiple known security vulnerabilities and discontinued support from Apple.

{% embed url="https://www.cisa.gov/uscert/ncas/alerts/TA16-105A" %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% embed url="https://gist.github.com/wise-io/5f25fd15ccc8a9281a819a9cb2c13bec" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://support.apple.com/en-us/HT205771" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec" %}

**Cmdlet Documentation:**

* [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.2)
* [Get-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-itemproperty?view=powershell-7.2)
* [Select-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.2)
* [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
