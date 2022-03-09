---
description: PowerShell script to silently install Foxit Reader Enterprise.
---

# Foxit Reader

## Overview

{% hint style="info" %}
**Note:** You should [register with Foxit](https://www.foxit.com/pdf-reader/enterprise-register.html) before distributing the Enterprise version of their software.
{% endhint %}

**Prerequisites:**

1. Register with Foxit [**here**](https://www.foxit.com/pdf-reader/enterprise-register.html)****
2. Deploy via your RMM solution

## Script

{% embed url="https://gist.github.com/wise-io/8c8f4aabd820666df372cce0936c9fcf" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://cdn01.foxitsoftware.com/pub/foxit/manual/reader/en_us/FoxitReaderDeploymentAndConfiguration11.2.1_Manual.pdf" %}

{% embed url="https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec" %}

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

**Cmdlet Documentation:**

* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.2)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.2)
