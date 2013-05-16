---
title: Site Production
abstract: Details on how this site is built
---

## Toolset
This site is generated as static HTML via [nanoc][], and [the source is available on GitHub][source]. The [site history page][] provides further background.

[nanoc]: http://nanoc.ws/
[source]: https://github.com/gerwitz/hans.gerwitz.com/
[site history page]: /site/history.html

Styling is strongly assisted by [Normalize.css][] and a few icons from [Font Awesome][]. It's all hosted on a little Ubuntu slice in [Rackspace Cloud][] (née Slicehost).

[normalize.css]: http://necolas.github.io/normalize.css/
[font awesome]: http://gregoryloucas.github.io/Font-Awesome-More/
[rackspace cloud]: http://www.rackspace.com/cloud/

## Services

![listener](about/rat-mic.png){:.float-left}
[Google Analytics][goog] is used for usage tracking and may drop a cookie on you. I've set my account to [not share tracking data][ua], but you have no way to validate that and I have no way to confirm that Google honors this setting.

Other external resources are referenced, including [Twitter's][twtr] scripts for explicit pop-ups and [Microsoft's][msft] CDN for jQuery. On the [homepage](/) a few extras are loaded: JSON and assets from [Tumblr][] and a [Flickr][] script which insists on loading a Yahoo geolocation script as well as requested assets. None of these should be using this to track you, but my control is limited so YMMV.

[goog]: http://www.google.com/analytics/
[ua]: https://support.google.com/analytics/answer/1011397?hl=en
[twtr]: https://dev.twitter.com/docs/intents
[msft]: http://www.asp.net/ajaxlibrary/cdn.ashx
[tumblr]: http://www.tumblr.com/api
[flickr]: http://www.flickr.com/badge.gne

Search is via [Tapir][], which is called only when invoked and graciously provided by a little Dutch agency, [80 beans][].

[tapir]: http://tapirgo.com/
[80 beans]: http://www.80beans.com/

## &c.

All original work is licensed by Hans Gerwitz under <a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_US">CC BY 3.0</a>.

[The literals are commended to favor](http://www.languagehat.com/archives/004068.php).
