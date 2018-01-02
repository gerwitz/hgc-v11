xml.instruct!
xml.rss "version" => "2.0" do
  site_url = "http://hans.gerwitz.com/"
  xml.channel do
    xml.title "hans.gerwitz.com"
    xml.subtitle "Blog posts"
    xml.link "href" => site_url
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
