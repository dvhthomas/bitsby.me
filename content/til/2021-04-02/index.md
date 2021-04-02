---
title: 2021 04 02
date: 2021-04-02T10:13:32-06:00
tags: [tools, google-cloud]
toc: true
series: []
summary: 
mermaid: false
mathjax: false
draft: false
---

## Squishing PNGs

As part of this TIL process I wanted to include a sizable PNG into a post.
Following [this advice](https://til.simonwillison.net/macos/shrinking-pngs-with-pngquant-and-oxipng) it's a good idea to squish PNG images down before adding to Git or the blog.
I'm seeing results like a reduction from 480kb to 70kb.

One time:

```sh
brew install pngquant oxipng
```

Then use like so, passing in the name of a content directory containing PNGs to squish:

```sh
pngquant --quality 20-50 content/til/2021-03-31/*.png
oxipng -o 3 -i 0 --strip safe content/til/2021-03-31/*-fs8.png
```

## Protecting content on a Google Cloud Storage-hosted web site

Dave found this great post while investigating how to host an authenticated/authorized static site.

[Protecting static website assets hosted on Cloud Storage
](https://cloud.google.com/community/tutorials/securing-gcs-static-website)

It's a creative use of a load balancer, network endpoint group (NEG), serverless login page to create a cookie/token for Cloud CDN to use.
