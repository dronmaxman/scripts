---
description: PowerShell script to start or restart a program.
---

# Start Program

## Overview

{% hint style="info" %}
**Dev Insight:** This script can be helpful for clients with programs that need to be running 24/7, but aren't installed as a Windows service.
{% endhint %}

This script will start the designated program if it isn't running. To restart an already running program, the `-Restart` parameter can be used.

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% embed url="https://gist.github.com/wise-io/5330b0cc40ea14a69d703f8049a7de2e" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

**Cmdlet Documentation:**

* [Get-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-5.1)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-5.1)
* [Stop-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/stop-process?view=powershell-5.1)
* [Wait-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/wait-process?view=powershell-5.1)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
