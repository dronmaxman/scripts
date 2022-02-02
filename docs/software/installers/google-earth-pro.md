---
description: PowerShell script to silently install the latest version of Google Earth Pro.
---

# Google Earth Pro

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written to deploy [Google Earth Pro](https://www.google.com/earth/versions/#earth-pro) to all machines at a Construction Company.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% embed url="https://gist.github.com/wise-io/f54fdca0558d77032ef95dcf29853cd9" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

**Cmdlet Documentation:**

* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.2)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.2)
