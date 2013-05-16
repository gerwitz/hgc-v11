module Posts

	def check_data(params)
		raise RuntimeError.new('Cannot build feed: site configuration has no base_url') 	if @site.config[:base_url].nil?
		raise RuntimeError.new('Cannot build feed: no articles') if feed_posts(params).empty?
		raise RuntimeError.new('Cannot build feed: one or more articles doesn\'t have a date') if feed_posts(params).any? { |a| a[:date].nil? }
	end

	def feed_posts(params) 
		params[:posts] || latest_posts(10)
	end

  def latest_posts(max=nil)
    # total = @site.items.select{|p| p.attributes[:kind] == 'post'}.sort{|a, b| a.attributes[:date] <=> b.attributes[:date]}.reverse 
    total = sorted_posts_local_only
    max ||= total.length
    total[0..max-1]
  end

  def rss_feed(params={})
    print("building rss ")
  	require 'builder'
  	require 'time'
  	check_data params
  	# Create builder
  	buffer = ''
  	xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)
  	# Build feed
  	xml.instruct!
  	xml.rss(:version => '2.0') do
  		xml.channel do
        xml.title @site.config[:site_name]
  			xml.language 'en-us'
  			xml.lastBuildDate attribute_to_time(feed_posts(params).first[:date]).to_iso8601_time
  			xml.ttl '40'
  			xml.link @site.config[:base_url]
  			xml.description
  			feed_posts(params).each do |a|
  				xml.item do
  					xml.guid url_for(a)
            if a[:external]
    					xml.link a[:external]
            else
              xml.link url_for(a)
            end
            xml.title a[:title]
  					xml.pubDate attribute_to_time(a[:date]).to_iso8601_time
            if a[:categories]
              a[:categories].each do |cat|
                xml.category cat
              end
            end
  					xml.comments url_for(a)+'#comments'
            xml.description process_relative_urls(a.path, a.compiled_content)
            print('.')
  				end
  			end
  		end
  		return buffer
  	end
    print(" done\n")
  end
  
  def process_relative_urls(item_path, content)
    # content.gsub(/(&lt;[^(&gt;)]+\s+(src|href))=(['"]?)([^'"]+?)\3([(&gt;)])/) do
    content.gsub(/(<[^>]+\s+(src|href))=(['"]?)([^:'"]+?)\3(.+?[>])/) do
    # content.gsub(/(<[^>]+\s+(src|href))=(['"]?)([^:'"]*?)\3([>])/) do
      $1 + '=' + $3 + absolutize_url(item_path, $4) + $3 + $5
    end
  end
  
  def absolutize_url(item_path, target)
    # print("in '#{item_path}' absolutizing '#{target}'")
    if target.start_with?("//")
      url_s = target
    elsif target.start_with?("/")
      url_s = @site.config[:base_url] + target
    else
      url_s = @site.config[:base_url] + item_path.match(/(.*?)[^\/]*$/)[1] + target
    end
    # print(" to '#{url_s}'\n")

    return url_s
  end
  
end