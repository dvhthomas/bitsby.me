# My Blog

[Bits By Me](https://bitsby.me) uses the blog uses the hugo static site generator. Publishing articles is easy; working with Jupyter notebooks that become embedded GitHub gists is slightly more involved.

## Prerequisites

The easiest way to start is to [use a GitHub Codespace](https://codespaces.new/dvhthomas/blog?quickstart=1) or run locally as a devcontainer in VS Code (see [`devcontainer.json`](./.devcontainer/devcontainer.json) for details).

If you must use locally then you need to install:

- [Go](https://go.dev) - [I use `asdf`](https://bitsby.me/2021/03/asdf-for-runtime-management/) so `asdf install golang latest` works for me.
- [Hugo](https://gohugo.io/installation/) - `brew install hugo`
- [Task](https://taskfile.dev/installation/) - `go install github.com/go-task/task/v3/cmd/task@latest` && `asdf reshim`.

## Author and publish

Write a new blog post by providing a `TITLE` and calling the `task blog`:

```sh
TITLE="some-factoid" task blog
...write write write...
git add .
git commit -m "my cool post"
git push origin master
```

You do the roughly the same thing for Today I Learned posts but you don't provide a `TITLE`.

```sh
task today-i-learned
OR
task til
```

Each post is put into a folder like `til/1971-01-01/` or `blog/1971-01-01/awesome-title` with an `index.md` file. This gives you a spot to drop post-specific content next to the post itself. For example, if you want an image for a post you can drop it in that folder and reference it in the post thus:

## Hosting

The blog itself is hosting on GitHub Pages.
The DNS configuration is in [Squarespace Domains](https://domains.squarespace.com) accessible using my personal Google account.

## Preview

* If you're running in Codespaces or a Devcontainer you should already have a preview running on port 1313.
* If you're doing things manually, start a dev server by running `task`.
  That starts the `default` task, the dev server:

  ```shell
  task
  ```

Look at the draft [Tips](http://localhost:1313/2020/02/tips/) post to see examples of how you can use various elements like diagrams, code, and tweets.

If you want to publish and put all the non-draft content into the `public/` directory just type `hugo` on its own.

## Content pre-processing

### Shrink PNGs

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
