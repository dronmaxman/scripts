---
description: >-
  PowerShell script to manage Chrome/Edge browser extensions through local group
  policy.
---

# Browser Extensions

## Overview

{% hint style="info" %}
**Note:** This script only manages local group policies (LGPO). It does not affect group policies applied from a Domain Controller, but will affect the resulting policies.
{% endhint %}

This script uses the PolicyFileEditor PowerShell module to add extensions by ID to Chrome's or Edge's extension allow list (whitelist). When used, all extensions not explicitly allowed will be blocked from install. If they are already installed, they will be disabled automatically.

The script also allows extensions to be force installed by using the `-Force` parameter.

{% hint style="danger" %}
**Warning:** Removing extensions from the _Force Install List_ will uninstall them.
{% endhint %}

{% embed url="https://chrome.google.com/webstore/category/extensions" %}

{% embed url="https://microsoftedge.microsoft.com/addons" %}

**Prerequisites:**

1. Document the extension IDs of extensions you want to allow/install.
2. Deploy via RMM.&#x20;

## Script

{% embed url="https://gist.github.com/wise-io/8a9fa635964b2b0b41b4aa0809d6ea91" %}

## Usage Examples

{% hint style="info" %}
**Note:** Some RMM providers don't allow passing multiple values to array parameters. For compatibility with these RMMs, the script can accept a single value with commas.&#x20;

**Example:** `.\ManageBrowserExts.ps1 -Chrome ID1,ID2,ID3`
{% endhint %}

<details>

<summary>Allow an extension in Chrome or Edge (or both)</summary>

`.\ManageBrowserExts.ps1 -Chrome 'aapbdbdomjkkjkaonfhkkikfgjllcleb'`

`.\ManageBrowserExts.ps1 -Edge 'kkpalkknhlklpbflpcpkepmmbnmfailf'`

`.\ManageBrowserExts.ps1 -Chrome 'aapbdbdomjkkjkaonfhkkikfgjllcleb' -Edge 'kkpalkknhlklpbflpcpkepmmbnmfailf'`



</details>

<details>

<summary>Reset all extension policies in Chrome &#x26; Edge</summary>

`.\ManageBrowserExts.ps1 -Reset`&#x20;

`.\ManageBrowserExts.ps1 -Remove`

</details>

<details>

<summary>Reset existing extension policies and allow multiple extensions.</summary>

`.\ManageBrowserExts.ps1 -Reset -Edge 'gggmmkjegpiggikcnhidnjjhmicpibll', 'kkpalkknhlklpbflpcpkepmmbnmfailf'`

</details>

<details>

<summary>Remove an extension from allow list</summary>

`.\ManageBrowserExts.ps1 -Edge 'gggmmkjegpiggikcnhidnjjhmicpibll' -Remove`

</details>

<details>

<summary>Force install extensions</summary>

`.\ManageBrowserExts.ps1 -Reset -Edge 'gggmmkjegpiggikcnhidnjjhmicpibll', 'kkpalkknhlklpbflpcpkepmmbnmfailf' -Force`

</details>

<details>

<summary>Audit local extension policies</summary>

`.\ManageBrowserExts.ps1 -Audit`

**Example Output:**

```
   Browser: Google Chrome

Value Extension ID Type
----- ------------ ----
200   *            Block


   Browser: Microsoft Edge

Value Extension ID                     Type
----- ------------                     ----
200   *                                Block
200   gggmmkjegpiggikcnhidnjjhmicpibll Allow
201   kkpalkknhlklpbflpcpkepmmbnmfailf Allow
```

</details>

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://github.com/dlwyatt/PolicyFileEditor" %}

**Cmdlet Documentation:**

* [Format-Table](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/format-table?view=powershell-5.1)
* [Measure-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/measure-object?view=powershell-5.1)
* [New-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-object?view=powershell-5.1)
* [Select-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-5.1)
* [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-5.1)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-7.2)
