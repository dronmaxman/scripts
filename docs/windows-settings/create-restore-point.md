---
description: PowerShell script to create a System Restore Point for all local drives.
---

# Create Restore Point

## Overview

{% hint style="info" %}
**Dev Insight:** This script can be used to automate the creation of System Restore Points on client machines, or to create a one-off checkpoint before applying changes to a machine.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% hint style="info" %}
**Note:** As of Windows 8, the default settings will not allow the creation of more than one system restore point in 24 hours. To create a new checkpoint within the 24-hour period, use the `-Force` parameter.
{% endhint %}

{% embed url="https://gist.github.com/wise-io/b20f3c347b236662791e4117e94e5bba" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

**Cmdlet Documentation:**

* [Checkpoint-Computer](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/checkpoint-computer?view=powershell-5.1\&viewFallbackFrom=%3Dpowershell-7.2)
* [Enable-ComputerRestore](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/enable-computerrestore?view=powershell-5.1)
* [Get-CimInstance](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/get-ciminstance?view=powershell-7.2)
* [Remove-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-itemproperty?view=powershell-7.2)
* [Set-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-itemproperty?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
