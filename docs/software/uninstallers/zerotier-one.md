---
description: PowerShell script to silently uninstall ZeroTier One and its components.
---

# ZeroTier One

## Overview

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% hint style="info" %}
**Notes:** This script will not remove a device from the ZeroTier dashboard.

A reboot is recommended after running this script if you plan to reinstall ZeroTier.&#x20;
{% endhint %}

{% embed url="https://gist.github.com/wise-io/9fd31d8203343e99844cbb9967f30298" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

**Cmdlet Documentation:**

* [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.2)
* [Get-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-itemproperty?view=powershell-7.2)
* [Select-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.2)
* [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
