---
title: Jekyll.- Quick Helper
date: 2025-01-07 13:23:00 -700
categories: [Jekyll]
tags: [jekyll, static site generator]     # TAG names should always be lowercase
---

Jekyll helper

## Execute
```
bundle exec jekyll s
```

### Execute with reload in a container
```
bundle exec jekyll serve --livereload --force_polling
```

## Build
```
jekyll build
JEKYLL_ENV=production jekyll build
```

## Configure (Windows)
```
$ENV:JEKYLL_ENV = "production"
$ENV:JEKYLL_ENV = $null
[Environment]:SetEnvironmentVariable("JEKYLL_ENV", "production", "User")
echo $Env:JEKYLL_ENV
```

## Configure (Debian)
```
export JEKYLL_ENV=production
unset JEKYLL_ENV
echo $JEKYLL_ENV
```

## Bundle clean
```
bundle clean --force
```
