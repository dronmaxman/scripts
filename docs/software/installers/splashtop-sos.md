---
description: PowerShell script to silently deploy the Splashtop SOS executable.
---

# Splashtop SOS

## Overview

{% hint style="info" %}
**Dev Insight:** This script can be used to prepare [Splashtop SOS](https://my.splashtop.com/splashtop\_referral/AAHHHEKrtj9mT9) as an alternative method of attended remote access for user support when your primary remote access tool is down.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% embed url="https://gist.github.com/wise-io/3b0ea45654a30fb77d6b363a6ef40663" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec" %}

**Cmdlet Documentation:**

* ​[Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [New-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7.2)
* [New-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-object?view=powershell-7.2)
* [Split-Path](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/split-path?view=powershell-7.2)
* [Test-Path](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
