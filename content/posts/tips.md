---
title: "Tips"
date: 2020-02-12T07:45:59-07:00
draft: true
---

## Twitter

I did a thing and it got posted.

{{< twitter 1227233988579876864 >}}

## Link to a post

By reference:

[Welcome back!]({{< ref "posts/welcome-back.md" >}})

Or a specific link in a page. This uses the fact that markdown adds an automatic ref to titles:

[Blogging title]({{< relref "posts/welcome-back.md#im-blogging-again" >}})

## A gist on Github

{{< gist dvhthomas 239909 >}}

## Code snippet

Note the highlighted lines:

{{< highlight bash "hl_lines=1" >}}
$ echo "hello world"
hello world
{{</ highlight>}}
