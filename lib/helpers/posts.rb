module Posts

  def posts
    @items.select { |item| item[:kind] == 'post' }
  end

  def sorted_posts
    posts.sort_by do |a|
      attribute_to_time(a[:date])
    end.reverse
  end
  
  def sorted_posts_local_only
    posts.sort_by do |a|
      attribute_to_time(a[:date])
    end.reverse.delete_if{|a| a[:external]}
  end
  
  # attributes we use:
  # * date
  # * title
  # * categories
  # * tags
  # * abstract

  # Returns the URL for the given item. It will return the URL containing
  # the custom path in the feed if possible, otherwise the normal path.
  #
  # @param [Nanoc3::Item] item The item for which to fetch the URL.
  #
  # @return [String] The URL of the given item
  def url_for(item)
    # Check attributes
    if @site.config[:base_url].nil?
      raise RuntimeError.new('Cannot build URL for item: site configuration has no base_url')
    end

    # Build URL
    if item.path
      @site.config[:base_url] + item.path
    end
  end

  # Copied from Blogging helper.
  #
  # Converts the given attribute (which can be a string, a Time or a Date)
  # into a Time.
  #
  # @param [String, Time, Date] time Something that contains time
  #   information but is not necessarily a Time instance yet
  #
  # @return [Time] The Time instance corresponding to the given input
  def attribute_to_time(time)
    time = Time.local(time.year, time.month, time.day) if time.is_a?(Date)
    time = Time.parse(time) if time.is_a?(String)
    time
  end

end
