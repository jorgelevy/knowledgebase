---
title: Power Shell.- OhMyPosh configuration
date: 2024-08-05 19:26:00 -700
categories: [PowerShell]
tags: [powershell, ohmyposh]     # TAG names should always be lowercase
---

Configura Oh My Posh for PowerShell

[Oh My Posh](https://ohmyposh.dev/)

## Winget
```
winget install JanDeDobbeleer.OhMyPosh --source winget
```

## Download CaskaydianMono Nerd Font
<https://ohmyposh.dev/docs/installation/fonts>
```
oh-my-posh font install CascadiaCode
```

## Configure Prompt
<https://ohmyposh.dev/docs/installation/prompt>

Create profile file
```
New-Item -Path $PROFILE -Type File -Force
notepad $PROFILE
```

Profile file content
```
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\craver.omp.json" | Invoke-Expression
$env:Path += ';D:\Jorge\Tweeks\Scripts'
```
