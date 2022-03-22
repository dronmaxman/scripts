---
description: >-
  PowerShell script to silently install the Microsoft Teams Machine-Wide
  Installer.
---

# Microsoft Teams

## Overview

This script will install the latest version of the **Microsoft Teams Machine-Wide Installer**. Once installed, Microsoft Teams will be installed for each user on their _next login_.

By default, the script will install the Teams version matching the system architecture, but the `-x86` switch parameter can be used to install 32-bit Teams on 64-bit systems.

{% hint style="info" %}
**Note:** If a user uninstalls Teams from their user profile, it will not be reinstalled to their user profile automatically. To redeploy Teams for this user, follow [Microsoft's clean up and redeployment procedures](https://docs.microsoft.com/en-us/microsoftteams/msi-deployment#clean-up-and-redeployment-procedure).
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

**Example Usage:** `.\InstallTeams.ps1 -x86`

{% embed url="https://gist.github.com/wise-io/4012a01b051d3ae4497bab7069a9459a" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.microsoft.com/en-us/microsoftteams/msi-deployment" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec" %}

**Cmdlet Documentation:**

* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-5.1)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-5.1)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-5.1)
