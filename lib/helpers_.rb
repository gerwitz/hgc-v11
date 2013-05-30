#!/usr/bin/ruby
require 'rubygems'
require 'cgi'
include Posts
include Nanoc::Helpers::Breadcrumbs
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::XMLSitemap

# NOT IN USE
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
module Nanoc::Helpers::LinkTo
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

def item_description(item)
  type = item[:kind] || 'page'
  description = item[:abstract] || "A #{type} on #{@site.config[:site_name]}"
  return description
end

def tweet_intent_url(item)
	tweet_url = 'https://twitter.com/intent/tweet'
	tweet_url += '?url=' + CGI::escape(@site.config[:base_url] + item.path)
  tweet_url += '&text=' + CGI::escape(item[:title])
	tweet_url += '&via=gerwitz'
	tweet_url += '&related=gerwitz,shannonethomas'
  return tweet_url
end

def facebook_share_url(item)
	tweet_url = 'https://www.facebook.com/dialog/feed?app_id=138710993114'
	tweet_url += '&link=' + CGI::escape(@site.config[:base_url] + item.path)
	tweet_url += '&name=' + CGI::escape(item[:title])
	tweet_url += '&description=' + CGI::escape(item_description(item))
	tweet_url += '&redirect_uri=' + CGI::escape(@site.config[:base_url])
  return tweet_url
end

