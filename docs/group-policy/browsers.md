---
description: >-
  PowerShell script to manage Chrome & Edge browser settings through local group
  policy.
---

# Browser Policies

## Overview

{% hint style="info" %}
**Note:** This script only manages local group policies (LGPO). It does not affect group policies applied from a Domain Controller, but will affect the resulting policies.
{% endhint %}

This script was written to provide a way to set a more secure baseline for my client's web browsers. The settings chosen to apply will work for most clients to provide some extra security while not preventing them from doing their work. That said, these settings may not work for all clients. _**Be sure to review each policy to ensure a good fit for your client base before running this script.**_

Combining this script with the browser extension management script will add an additional security layer to your clients' devices, for no additional cost.

{% content-ref url="browser-extensions.md" %}
[browser-extensions.md](browser-extensions.md)
{% endcontent-ref %}

**Prerequisites:**

1. Review/Adjust each policy setting in the script
2. Deploy via RMM

## Script

{% embed url="https://gist.github.com/wise-io/6c4327e517d423ec04d819b5770a8fe2" %}

## Usage Examples

<details>

<summary>Set browser policies</summary>

`.\ManageBrowsers.ps1`

Using no parameters will set all policies defined in the script, excluding the default search engine policies.

</details>

<details>

<summary>Set browser policies (including default search engine)</summary>

`.\ManageBrowsers.ps1 -Search Google`

This will set all policies defined in the script, including the default search engine policies. Currently supported search engines are [Google](https://www.google.com) and [Bing](https://www.bing.com).

</details>

<details>

<summary>Reset all policies for Chrome &#x26; Edge</summary>

`.\ManageBrowsers.ps1 -Reset`&#x20;

When the `-Reset` switch is used, the script will only clear the existing browser policies (LGPO). No new policies will be set.

</details>

<details>

<summary>Audit local browser policies</summary>

`.\ManageBrowsers.ps1 -Audit`

When the `-Audit` switch is used, the script will only output the currently set browser policies. No policies will be set.

</details>

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://github.com/dlwyatt/PolicyFileEditor" %}

**Cmdlet Documentation:**

* [Format-Table](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/format-table?view=powershell-5.1)
* [Select-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-5.1)
* [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-5.1)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
