#!/usr/bin/ruby
require 'rubygems'
require 'cgi'
include Posts
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::XMLSitemap

# Is this item a child of another item?
def this_is_child_of(rep)
  return false if rep.is_a?(String)
  return true if @item_rep.path == rep.path
  rep.children.each do |child|
    return true if this_is_child_of(child)
  end
  return false
end

# Improved link_to_unless_current
module Nanoc3::Helpers::LinkTo
  def link_to_unless_current(text, path_or_rep, attributes={})
    # Find path
    path = path_or_rep.is_a?(String) ? path_or_rep : path_or_rep.path
    
    if @item_rep and @item_rep.path == path
      # Join attributes
      attributes = attributes.inject('') do |memo, (key, value)|
        memo + key.to_s + '="' + h(value) + '" '
      end
      # Create message
      "<a#{attributes}>#{text}</a>"
    else
      link_to(text, path_or_rep, attributes)
    end
  end
end

def filelike_identifier(item)
  if item.binary?
    # Write item with identifier /foo/ to /foo.ext
    return item.identifier.chop + '.' + item[:extension]
  else
    # Write item with identifier /foo/ to /foo.html
    return item.identifier.chop + '.html'
  end
end

def tweet_intent_url(item)
	tweet_url = 'https://twitter.com/intent/tweet'
	tweet_url += '?url=' + CGI::escape(@site.config[:base_url] + item.path)
	tweet_url += '&via=gerwitz'
	tweet_url += '&related=gerwitz,shannonethomas'
  return tweet_url
end
