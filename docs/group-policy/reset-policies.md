---
description: PowerShell script to clear all local group policies.
---

# Reset Policies

## Overview

{% hint style="info" %}
**Note:** This script only resets local group policies (LGPO). It does not affect group policies applied from a Domain Controller.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% hint style="danger" %}
**Warnings:** \
Running this script will result in the loss of existing local policies.\
Using the `-Reboot` switch may result in the loss of unsaved user files.
{% endhint %}

{% embed url="https://gist.github.com/wise-io/e299a7113d48d3e16f1c24aa3575cc76" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/gpupdate" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/shutdown" %}

**Cmdlet Documentation:**

* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
