---
title: Power Shell.- Set Environment Variables
date: 2025-12-14 20:15:00 -700
categories: [PowerShell]
tags: [powershell, environment variables]     # TAG names should always be lowercase
---

```
$ENV:NODE_OPTIONS = '--max_old_space_size=8192'
[Environment]::SetEnvironmentVariable("NODE_OPTIONS", "--max_old_space_size=8192", "User")


$Env:JEKYLL_ENV = $null
$Env:JEKYLL_ENV = "production"
[Environment]:SetEnvironmentVariable("JEKYLL_ENV", "production", "User")
```
