# My Blog

[Bits By Me](https://bitsby.me) uses the blog uses the hugo static site generator. Publishing articles is easy; working with Jupyter notebooks that become embedded GitHub gists is slightly more involved.

## Author and publish

```bash
# Write a new blog post
./newblog some-factoid # note the dashes...
...write write write...
git add .
git commit -m "my cool post"
git push origin master
```

You do the same thing for Today I Learned posts.
Except you run `./newtil and you don't need to provide a title.

Each post is put into a folder like `til/1971-01-01/` or `blog/1971-01-01/awesome-title` with an `index.md` file. This gives you a spot to drop post-specific content next to the post itself. For example, if you want an image for a post you can drop it in that folder and reference it in the post thus:

## Preview

To start a dev server which also published Draft content:

```shell
./serve
```

Look at the draft [Tips](http://localhost:1313) post to see examples of how you can use various elements like diagrams, code, and tweets.

If you want to publish and put all the non-draft content into the `public/` directory just type `hugo` on its own.
