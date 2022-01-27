---
description: PowerShell script to silently install the latest version of Zoom Meetings.
---

# Zoom Meetings

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written during the beginning of the COVID-19 pandemic as a way to quickly deploy [Zoom Meetings](https://zoom.us) to client devices.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

For more configuration options, see Zoom's [documentation for mass deployment](https://support.zoom.us/hc/en-us/articles/201362163-Mass-deployment-with-preconfigured-settings-for-Windows).

## Script

{% embed url="https://gist.github.com/wise-io/ec84b50a6a840c03b57441f24bee3000" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://support.zoom.us/hc/en-us/articles/201362163-Mass-deployment-with-preconfigured-settings-for-Windows" %}

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec" %}

**Cmdlet Documentation:**

* ​[Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
