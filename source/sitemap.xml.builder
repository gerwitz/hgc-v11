xml.instruct!
site_url = "http://hans.gerwitz.com/"
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.path =~ /\.html/ && !page.data.noindex == true && !(page.path.start_with?('writing/') && page.published? == false) }.each do |page|
    xml.url do
      xml.loc URI.join(site_url, page.url)
#{page.url}"
      xml.lastmod Date.today.to_time.iso8601
      xml.changefreq page.data.changefreq || "monthly"
      xml.priority page.data.priority || "0.5"
    end
  end
end
