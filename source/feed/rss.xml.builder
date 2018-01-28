xml.instruct!
xml.rss "version" => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  site_url = "https://hans.gerwitz.com/"
  xml.channel do
    xml.title "hans.gerwitz.com"
    xml.description "Blog posts"
    xml.link site_url
    xml.tag! 'atom:link', "href" => URI.join(site_url, current_page.path), "rel" => "self", "type" => "application/rss+xml"
    blog.articles.select{|a| !a.data.title.nil? }[0..10].each do |article|
      xml.item do
        xml.title article.title
        xml.link URI.join(site_url, article.url)
        xml.guid URI.join(site_url, article.url)
        xml.pubDate article.date.to_time.rfc822
        xml.description article.body
      end
    end
  end
end
