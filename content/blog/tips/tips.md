---
title: "Tips"
date: 2020-02-12T07:45:59-07:00
draft: true
mermaid: true
---

## Twitter

I did a thing and it got posted.

{{< twitter 1227233988579876864 >}}

## Link to a post

By reference:

[Welcome back!]({{< ref "blog/2020-02-11/welcome-back/index.md" >}})

Or a specific link in a page. This uses the fact that markdown adds an automatic ref to titles:

[Blogging title]({{< relref "blog/2020-02-11/welcome-back/index.md#im-blogging-again" >}})

## A gist on Github

{{< gist dvhthomas 239909 >}}

## Code snippet

If you include code inline you also get the ability to highlight lines:

{{< highlight bash "hl_lines=1" >}}
$ echo "hello world"
hello world
{{</ highlight>}}

But practically speaking it may be easier to include code from files that live in the same directory as the `index.md` for each post.

For example the file `hello.py` is in the same directory as `tips.md`.
We can display it using

{{% code file="hello.py" lang="python" %}}

## Diagrams

The YAML front matter contains `mermaid: true` and then this will render a nice diagram.

{{<mermaid>}}
graph TD;
    t(top node)
    note
    t-->B;
{{</mermaid>}}

## Reference URLs

You can avoid typing a URL multiple times by using a reference-type URL.
Use either a numbered [footnote style for whatever text][1].
Or specific text that matches the [link text itself].

[1]: http://slashdot.org
[link text itself]: http://www.reddit.com
