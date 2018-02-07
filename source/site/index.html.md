---
title: About This Site
---

## Toolset

This site is generated as static HTML via [Middleman][], and [the source is available on GitHub][source]. The [site history page][] provides further background.

[middleman]: https://middlemanapp.com/
[source]: https://github.com/gerwitz/hans.gerwitz.com/
[site history page]: history.html

Search is kept local thanks to [lunr][].

When I publish to a specific git branch, [Travis CI][travis] builds the site and deploys to Amazon S3. Cloudfront serves it to you.

[travis]: https://travis-ci.org/

[lunr]: https://lunrjs.com/

## External Services

![listener](site/rat-mic.png)
[Google Analytics][goog] is used for usage tracking and may drop a cookie on you. I've set my account to [not share tracking data][ua], but you have no way to validate that and I have no way to confirm that Google honors this setting.

Other external resources are referenced, including [Twitter's][twttr] scripts for explicit pop-ups and jQuery from [their CDN][jquery]. On the [homepage](/) a [Flickr][] script is loaded which insists on loading a Yahoo geolocation script as well as requested assets. None of these should be using this to track you, but my control is limited so YMMV.

[goog]: http://www.google.com/analytics/
[ua]: https://support.google.com/analytics/answer/1011397?hl=en
[twttr]: https://dev.twitter.com/docs/intents
[jquery]: https://code.jquery.com/
[flickr]: http://www.flickr.com/badge.gne

## &c.

All original work is licensed by Hans Gerwitz under <a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_US">CC BY 3.0</a>.

[The literals are commended to favor](http://www.languagehat.com/archives/004068.php).
