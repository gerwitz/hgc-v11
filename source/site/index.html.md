---
title: Colophon
---

## What's with the ⴲ?

The circled cross is an ancient astronomy symbol for Earth. I am fond of Earth.

It's also used for [XOR](https://en.wikipedia.org/wiki/Exclusive_or), which tickles my fancy as a fan of Boolean algebra and matrix mathematics.

Of course, there are [many other meanings](https://en.wikipedia.org/wiki/Sun_cross) in various cultures. As such, it appears several times in Unicode:

- [U+2A01](https://unicode-table.com/en/2A01/): N-ary circle plus operator (⨁)
- [U+2295](https://unicode-table.com/en/2295/): circled plus (⊕)
- [U+2D32](https://unicode-table.com/en/2D32/): Tifinagh letter yabh (ⴲ)
- [U+1F728](https://unicode-table.com/en/1F728/): alchemical symbol for verdigris (🜨)

## How do you make this?

This site is generated as static HTML via [Middleman][], and [the source is available on GitHub][source].

[middleman]: https://middlemanapp.com/
[source]: https://github.com/gerwitz/hans.gerwitz.com/

Search is kept local thanks to [lunr][].

When I publish to a specific git branch, [Travis CI][travis] builds the site and deploys to Amazon S3. Cloudfront serves it to you.

[travis]: https://travis-ci.org/

[lunr]: https://lunrjs.com/

Body type is set in [ITF](https://www.indiantypefoundry.com/) Poppins.

## Who else is making this work?

Type is served by the [Font Library](https://fontlibrary.org/).

![listener](site/rat-mic.png)
[Google Analytics][goog] is used for usage tracking and may drop a cookie on you. I've set my account to [not share tracking data][ua], but you have no way to validate that and I have no way to confirm that Google honors this setting.

Other external resources are referenced, including [Twitter's][twttr] scripts for explicit pop-ups and jQuery from [their CDN][jquery]. On the [homepage](/) a [Flickr][] script is loaded which insists on loading a Yahoo geolocation script as well as requested assets. None of these should be using this to track you, but my control is limited so YMMV.

[goog]: http://www.google.com/analytics/
[ua]: https://support.google.com/analytics/answer/1011397?hl=en
[twttr]: https://dev.twitter.com/docs/intents
[jquery]: https://code.jquery.com/
[flickr]: http://www.flickr.com/badge.gne

## &c.

The [site history page](history.html) provides further background.

All original work is licensed by Hans Gerwitz under <a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_US">CC BY 3.0</a>.

[The literals are commended to favor](http://www.languagehat.com/archives/004068.php).
