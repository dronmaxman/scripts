---
description: >-
  PowerShell scripts to manage Windows Defender & Firewall settings through
  local group policy.
---

# Windows Defender

## Overview

{% hint style="info" %}
**Note:** This script only manages local group policies (LGPO). It does not affect group policies applied from a Domain Controller, but will affect the resulting policies.
{% endhint %}

These scripts were written to provide a way to apply Windows Defender settings, and other security settings related to Windows Firewall and account auditing, across clients. By applying security settings through group policy, users cannot easily disable components or change the settings.

Combining these scripts with an RMM and [event log monitoring](https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/troubleshoot-microsoft-defender-antivirus?view=o365-worldwide) gives you a way to centrally manage/monitor Windows Defender, providing a valid alternative to third-party AV products to your clients.

_This is particular useful for clients that do not have_ [_Windows Defender for Endpoint_](https://www.microsoft.com/en-us/security/business/threat-protection/endpoint-defender) _licensing._

## Manage Settings

**Prerequisites:**

1. Review/Adjust each policy setting in the script
2. Deploy via RMM

{% hint style="info" %}
**Note Regarding ASR:** While this script can manage Windows Defender Attack Surface Reduction (ASR) rules, they are disabled by default because they may break certain software. It is recommended to set them to Audit Mode for a period and monitor the event log for issues before enabling them fully. _Certain ASR rules require proper licensing to function._
{% endhint %}

{% embed url="https://gist.github.com/wise-io/b159133319a85e1dd7dc3eca6d982363" %}

## Start a Scan

The below script can be used to run on demand scans with Windows Defender, including offline scans and scans of individual files/folders.&#x20;

_This script can also be run on a schedule with your RMM of choice. Alternatively, let Windows handle scheduled scans with the policies set in the script above._

{% hint style="danger" %}
**Warning:** Using the `Offline` scan type in the below script will restart a user's device and may result in data loss. Use with caution.
{% endhint %}

**Usage Example:** `.\ScanDefender.ps1 -Path 'C:\Users\john.doe\Downloads'`

{% embed url="https://gist.github.com/wise-io/4fa3fc00274a45ffa6b9df1f92126abc" %}

## Manage Exclusions

The below script can be used to add, remove, or audit exclusions for Windows Defender.&#x20;

{% embed url="https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/common-exclusion-mistakes-microsoft-defender-antivirus?view=o365-worldwide" %}

{% embed url="https://gist.github.com/wise-io/7d82c4216c5007a5be70c15699d338ff" %}

**Parameters:**

<details>

<summary><strong>Audit</strong></summary>

**Usage:** `.\ManageDefenderExclusions.ps1 -Audit`

The `-Audit` switch parameter displays a list of all currently applied exclusions rules after any new rules have been applied. If no parameters are passed to the script, `-Audit` is used.

</details>

<details>

<summary>ASR</summary>

**Usage:** `.\ManageDefenderExclusions.ps1 -ASR C:\Users\john.doe\dev`

Specifies the files and paths to exclude from Attack Surface Reduction (ASR) rules. Specify the folders or files and resources that should be excluded from ASR rules. Enter a folder path or a fully qualified resource name. For example, "C:\Windows" will exclude all files in that directory. "C:\Windows\App.exe" will exclude only that specific file in that specific folder.

</details>

<details>

<summary>Ext</summary>

**Usage:** `.\ManageDefenderExclusions.ps1 -Ext ost, pst`

Specifies an array of file name extensions, such as obj or lib, to exclude from scheduled, custom, and real-time scanning. This cmdlet removes the exclusions that you specify.

</details>

<details>

<summary>IP</summary>

**Usage:** `.\ManageDefenderExclusions.ps1 -IP 127.0.0.1`

Specifies an array of IP addresses to exclude from scheduled and real-time scanning.

</details>

<details>

<summary>Path</summary>

**Usage:** `.\ManageDefenderExclusions.ps1 -Path "C:\Utilities"`

Specifies an array of file paths to exclude from scheduled and real-time scanning. This cmdlet removes the exclusions that you specify.

</details>

<details>

<summary>Process</summary>

**Usage:** `.\ManageDefenderExclusions.ps1 -Process Code.exe`

Specifies an array of processes, as paths to process images. This cmdlet removes exclusions of files opened by the processes that you specify.

</details>

<details>

<summary>Remove</summary>

**Usage:** `.\ManageDefenderExclusions.ps1 -Remove -Ext ost, pst -Path "C:\Utilities"`

The `-Remove` switch parameter will remove all specified exclusions from Windows Defender.

</details>

## Learn More

Want to learn more about how this script works? Included below are official documentation links for all cmdlets used in this script, as well as other useful documentation where applicable.

{% embed url="https://github.com/dlwyatt/PolicyFileEditor" %}

{% embed url="https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/use-group-policy-microsoft-defender-antivirus?view=o365-worldwide" %}

{% embed url="https://docs.microsoft.com/en-us/powershell/module/defender?view=windowsserver2019-ps" %}

{% embed url="https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/troubleshoot-microsoft-defender-antivirus?view=o365-worldwide" %}

**Cmdlet Documentation:**

* [Auditpol](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/auditpol)
* [Out-Null](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/out-null?view=powershell-5.1)
* [Write-Output](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-output?view=powershell-5.1)
