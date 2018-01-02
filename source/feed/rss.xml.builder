<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>Example RSS Feed</title>
    <item>
      <title>Example Item</title>
      <description>A summary.</description>
      <link>http://www.example.com/foo</link>
      <guid>http://www.example.com/foo</guid>
      <pubDate>Mon, 23 Sep 2013 03:00:05 GMT</pubDate>
    </item>
  </channel>
</rss>

<link>http://liftoff.msfc.nasa.gov/</link>
<description>Liftoff to Space Exploration.</description>
<language>en-us</language>
<pubDate>Tue, 10 Jun 2003 04:00:00 GMT</pubDate>
<lastBuildDate>Tue, 10 Jun 2003 09:41:01 GMT</lastBuildDate>
<docs>http://blogs.law.harvard.edu/tech/rss</docs>
<generator>Weblog Editor 2.0</generator>
<managingEditor>editor@example.com</managingEditor>
<webMaster>webmaster@example.com</webMaster>
<item>
   <title>Star City</title>
   <link>http://liftoff.msfc.nasa.gov/news/2003/news-starcity.asp</link>
   <description>How do Americans get ready to work with Russians aboard the International Space Station? They take a crash course in culture, language and protocol at Russia's &lt;a href="http://howe.iki.rssi.ru/GCTC/gctc_e.htm"&gt;Star City&lt;/a&gt;.</description>
   <pubDate>Tue, 03 Jun 2003 09:39:21 GMT</pubDate>
   <guid>http://liftoff.msfc.nasa.gov/2003/06/03.html#item573</guid>
</item>

xml.instruct!
xml.rss "version" => "2.0" do
  xml.channel do
    xml.title "hans.gerwitz.com"
    xml.subtitle "Blog posts"
    xml.link "href" => URI.join(site_url)
  end
  blog.articles.select{|a| !a.data.title.nil? }[0..10].each do |article|
    xml.item do
      xml.title article.title
      xml.link URI.join(site_url, article.url)
      xml.guid URI.join(site_url, article.url)
      xml.pubDate article.date.to_time.iso8601
      xml.description article.body
    end
  end
end
