---
description: >-
  PowerShell scripts to manage Windows Defender & Firewall settings through
  local group policy.
---

# Settings

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
