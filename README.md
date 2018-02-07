# hans.gerwitz.com

See [`/source/site/index.html`](https://hans.gerwitz.com/site) for an overview, this README will only add detail to that.

Travis status: [![build status](https://api.travis-ci.org/gerwitz/hans.gerwitz.com.svg?branch=master)](https://travis-ci.org/gerwitz/hans.gerwitz.com)

## Guidelines

Aim for [POSH](http://microformats.org/wiki/posh).

Be as [IndieWeb](https://indieweb.org/) as possible.[^indie]

Degrade gracefully without Javascript.

Stick with jQuery and add libraries only reluctantly.

Be consistent with URLs:

- date-sensitive content, and only that, is hosted under `/YYYY/MM/DD/`
- most pages end with a format extension (`.html`)
- "index" pages end with a slash to acknowledge that they have children
- de-facto standard URLs may differ, such as `/now`

## Content Flows

Articles may be posted directly here, but are usually [PESOS](https://indieweb.org/PESOS) from other venues. These are hand-syndicated.

Notes are [POSSE](https://indieweb.org/POSSE), typically added here via a Micropub endpoint that commits to this repository. The Micro.blog service consumes `/feed/microblog.rss` and [cross-posts](help.micro.blog/2016/cross-posting-twitter/) each to both Twitter and Facebook.
