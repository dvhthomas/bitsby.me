---
title: 2021 04 29
date: 2021-04-29T17:46:36-06:00
tags: [git]
toc: true
series: []
summary: Default git branch name
mermaid: false
mathjax: false
draft: false
---

## Main not Master

I keep forgetting to choose the [more inclusive name](https://github.com/github/renaming) `main` for a default for new git repositories. Thanks to the handy hint when using `git init` these days, here is a one-liner to change this on an installation-wide basis:

```sh
git config --global init.defaultBranch main
```
