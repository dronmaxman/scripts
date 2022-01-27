---
description: >-
  PowerShell script to silently uninstall user based installations of WPS
  Office.
---

# WPS Office

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written as part of a bundle of scripts to help automate Microsoft Office deployments by removing [WPS Office](https://www.wps.com).
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% embed url="https://gist.github.com/wise-io/225087cb11a5c49d603bde0002f9350c" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

**Cmdlet Documentation:**

* [Get-ChildItem](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.2)
* [Get-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-itemproperty?view=powershell-7.2)
* [Select-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.2)
* [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
