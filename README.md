# My Blog

[Bits By Me](https://bitsby.me) uses the blog uses the hugo static site generator. Publishing articles is easy; working with Jupyter notebooks that become embedded GitHub gists is slightly more involved.

## Author and publish

```bash
# Write a Today I Learned (TIL) post
./newtil some-factoid # note the dashes...
...write write write...
git add .
git commit -m "my cool TIL"
git push origin master
```

You do the same thing for blog posts. Except you run `./newpost the-blog-title` instead.

Each post is put into a folder like `til/1971-01-01/the-title-of-the-post/` with an `index.md` file. This gives you a spot to drop post-specific content next to the post itself. For example, if you want an image for a post you can drop it in that folder and reference it in the post thus:

## Preview

To start a dev server which also published Draft content:

```shell
./serve
```

Look at the draft [Tips](http://localhost:1313) post to see examples of how you can use various elements like diagrams, code, and tweets.

If you want to publish and put all the non-draft content into the `public/` directory just type `hugo` on its own.
