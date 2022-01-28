---
description: PowerShell script to silently uninstall Meraki Systems Manager Agent.
---

# Meraki SM

## Overview

{% hint style="info" %}
**Did You Know:** Cisco used to offer a free tier of [Meraki Systems Manager](https://meraki.cisco.com/products/systems-manager/#) for up to 100 devices. This was a great way for small businesses to get access to MDM and RMM-like functionality for no cost. Cisco eventually retired this tier but still allows existing organizations to utilize it for free.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% embed url="https://gist.github.com/wise-io/5d61e2f97990c05058cd30c15411786b" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

**Cmdlet Documentation:**

* [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.2)
* [Get-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-itemproperty?view=powershell-7.2)
* [Select-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.2)
* [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
