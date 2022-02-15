---
description: PowerShell script to silently install the Splashtop for RMM viewer.
---

# Splashtop RMM Viewer

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written to ease deployment of the Splashtop for RMM viewer for RMMs that use it for end user remote access. However, it can also be used to install the viewer on internal endpoints for support staff.
{% endhint %}

**Prerequisites:**&#x20;

1. Obtain download url for Splashtop for RMM viewer
2. Add download url to script
3. Deploy script via RMM

{% embed url="https://www.splashtop.com/remote-access-integration-with-rmm" %}

## Script

{% embed url="https://gist.github.com/wise-io/0bebf10a339b1367bd0055788a416ac7" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/reg" %}

**Cmdlet Documentation:**

* ​[Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-5.1)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-5.1)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-5.1)
