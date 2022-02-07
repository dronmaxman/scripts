---
description: PowerShell script to silently install Adobe Acrobat Reader DC.
---

# Adobe Reader

## Overview

{% hint style="info" %}
**Note:** You must acquire a distribution license from Adobe in order to distribute their software without breaking their Terms of Service.
{% endhint %}

**Prerequisites:**

1. Apply for a distribution license [**here**](http://www.adobe.com/products/reader/rdr\_distribution1.html)****
2. Use the links provided by Adobe to download the installer you need (without bloatware)
3. Upload the installer to a trusted file hosting solution
4. Insert the url to download the installer on `line 6` of the script below
5. Deploy via your RMM solution

## Script

{% embed url="https://gist.github.com/wise-io/c6a0972089534b8ad3540675ab3331bc" %}

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://www.adobe.com/devnet-docs/acrobatetk/tools/DesktopDeployment/cmdline.html" %}

{% embed url="https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2" %}

**Cmdlet Documentation:**

* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.2)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7.2)
* [Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.2)
