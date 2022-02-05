---
description: PowerShell script to install Microsoft Office via the Office Deployment Tool.
---

# Install Office

## Overview

{% hint style="info" %}
**Dev Insight:** This script was written as part of a bundle of scripts to help automate and manage Microsoft Office deployments.
{% endhint %}

This script uses Microsoft's Office Deployment Tool (ODT) to download and install Microsoft Office using an XML configuration file that you specify. With the XML file, you can specify which Office components to install / remove, which languages to install, and even default settings.

{% embed url="https://www.microsoft.com/en-us/download/details.aspx?id=49117" %}

{% embed url="https://config.office.com" %}

**Prerequisites:**

1. Download ODT and run it to extract the **setup executable**.
2. Create and export an XML configuration file at [https://config.office.com](https://config.office.com).
3. Upload **setup.exe** and your XML configuration file to your preferred file host.
4. Deploy via your RMM.

## Script

{% hint style="info" %}
**Note:** If you specify Office Content Delivery Network (CDN) as your deployment option, be sure to use the `-Download` switch.
{% endhint %}

I've included an example configuration XML in addition to the script below.

{% embed url="https://gist.github.com/wise-io/b20b905e7322d1ad3d80a542acfa1cac" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

**Cmdlet Documentation:**

* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
