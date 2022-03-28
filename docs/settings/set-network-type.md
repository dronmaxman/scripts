---
description: PowerShell script to set the network category (type) to Public or Private.
---

# Set Network Type

## Overview

{% hint style="info" %}
**Note:** This script should be run with administrator privileges.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

**Usage:** `.\SetNetworkCategory.ps1 -Category Private`

{% embed url="https://gist.github.com/wise-io/d3d4c54dd3c6faceab1bf4a4982767f8" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

**Cmdlet Documentation:**

* [Get-Culture](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-culture?view=powershell-5.1)
* [Get-NetConnectionProfile](https://docs.microsoft.com/en-us/powershell/module/netconnection/get-netconnectionprofile?view=windowsserver2019-ps)
* [Set-NetConnectionProfile](https://docs.microsoft.com/en-us/powershell/module/netconnection/set-netconnectionprofile?view=windowsserver2019-ps)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-5.1)
