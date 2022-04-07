---
description: PowerShell script to silently deploy the latest ZeroTier One client.
---

# ZeroTier One

## Overview

This script was written to ease deployment of the ZeroTier client across multiple systems. When the optional `-Token` parameter is used, the script will install the ZeroTier client, add it to your ZeroTier network, authorize it, and name the device. Additional parameters are available for the various configuration options.

_Use of the `-Headless` parameter is recommended for a completely silent installation requiring no user interaction._

**Prerequisites:**&#x20;

1. Create a ZeroTier account / network
2. Copy network ID
3. Create an API access token (optional)
4. Deploy ZeroTier using the script below

{% embed url="https://www.zerotier.com" %}

## Script

{% hint style="info" %}
**Note:** This script requires PowerShell 7 to access the ZeroTier API. If the `-Token` parameter is used and PowerShell 7 is not already installed, it will be installed by the script.
{% endhint %}

{% embed url="https://gist.github.com/wise-io/67dc7289edaedaf2a5340aadf81dfd37" %}

## Parameters

* **`-NetworkID` (Required)** : ZeroTier Network ID for the network you are deploying
* **`-Token`** : ZeroTier API access token
* **`-Headless`** : Installs ZeroTier with no UI components
* **`-ManageDNS`** : Allows ZeroTier to manage DNS
* **`-GlobalRoutes`** : Allows ZeroTier managed routes to overlap public IP space
* **`-DefaultRoute`** : Allows ZeroTier to override system default route (full tunnel)

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://docs.zerotier.com/central/v1" %}

{% embed url="https://zerotier.atlassian.net/wiki/spaces/SD/overview" %}

**Cmdlet Documentation:**

* [ConvertTo-JSON](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json?view=powershell-7.2)
* [ConvertTo-SecureString](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertto-securestring?view=powershell-7.2)
* [Invoke-Expression](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-expression?view=powershell-7.2)
* [Invoke-RestMethod​](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-restmethod?view=powershell-7.2)
* [Invoke-WebRequest](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-5.1)
* [Remove-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-5.1)
* [Remove-ItemProperty](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-itemproperty?view=powershell-7.2)
* [Stop-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/stop-process?view=powershell-7.2)
* [Test-Path](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path?view=powershell-7.2)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-5.1)
