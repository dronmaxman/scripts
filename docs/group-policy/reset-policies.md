---
description: PowerShell script to clear all local group policies.
---

# Reset Policies

## Overview

{% hint style="info" %}
**Note:** This script only resets local group policies (LGPO). It does not affect group policies applied from a Domain Controller.
{% endhint %}

**Prerequisites:** This script requires no additional setup. Simply deploy it via your RMM.

## Script

{% hint style="warning" %}
**Warnings:** \
Running this script will result in the loss of existing local policies.\
Using the `-Reboot` switch may result in the loss of unsaved user files.
{% endhint %}

{% embed url="https://gist.github.com/wise-io/e299a7113d48d3e16f1c24aa3575cc76" %}

