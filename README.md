# My Blog

[Bits By Me](https://bitsby.me) uses the blog uses the hugo static site generator. Publishing articles is easy; working with Jupyter notebooks that become embedded GitHub gists is slightly more involved.

## Author and publish

```bash
make post title="some-interesting-title" # note the dashes...
...write write write...
git add .
git commit -m "my cool new post"
git push origin master
```

Each post is put into a a folder `posts/the-title-of-the-post/` with an `index.md` file. This gives you a spot to drop post-specific content next to the post itself. For example, if you want an image for a post you can drop it in that folder and reference it in the post thus:

```md
## My post

Something neat.

![A helpful graphic](the-image-file.png)
```

Or you can use a hugo shortcode like this:

```md
{{< figure src="the-image-file.png" title="A helpful graphic" >}}
```

It just makes it easier to manage content.

## Embedding content

Use the `code` shortcode. This looks for files by name _within the same directory as the post_. So for example, if the post is in `content/posts/2021-01-01-hello/index.md` then you could include the file `content/posts/2021-01-01-hello/test.py` like so:

```txt
{{% code file="test.py" lang="python" %}
```

## Diagrams

[MermaidJS](https://mermaid-js.github.io/mermaid/#/) diagrams are supported.

In the front matter include the `mermaid = true` statment, then in the body do something like this:

```txt
{{<mermaid>}}
graph TD;
    t(top node)
    note
    t-->B;
{{</mermaid>}}
```

## Notebooks

Notebooks are pushed to gists where they can be embedded in posts using the `{{ gist 123234 }}` shortcode. But I want to work on those notebooks locally first, and keep a copy of the source code without relying exclusively on gists.

To add and work on a notebook, first make sure you have a Python virtualenv setup, do the One Time setup.

### One time

Get a Python virtual environment set up. This also pulls in any python dependencies, so make sure your `requirements.txt` file us up to date with regular `python3 -m pip freeze > requirements.txt`.

```bash
make setup
```

### Every time

```bash
source .venv/bin/activate
jupyter notebook
```

### For each notebook dependency

Put notebooks in the `notebooks` directory. Any file other than an `*.ipynb` will be ignored by Git.

As you're working in a new notebook, first install the dependencies from _directly in the notebook_ thus (following advice from [this excellent blog post](https://jakevdp.github.io/blog/2017/12/05/installing-python-packages-from-jupyter/#How-to-use-Pip-from-the-Jupyter-Notebook)):

```python
# Install a pip package in the current Jupyter kernel
import sys
!{sys.executable} -m pip install numpy
```

And then use them:

```python
import numpy as np
```

This is preferable to installing the dependencies in the virtual environment _and_ saving them in requirements.txt.
