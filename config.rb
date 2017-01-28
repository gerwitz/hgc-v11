###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end
#page "/*", layout: :page

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
helpers do
    def nav_link(link_text, url, options = {})
      options[:class] ||= ""
      options[:class] << " current" if current_resource.url.start_with?(url)
      link_to(link_text, url, options)
    end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# set :relative_links, true

# assume HTML so we don't have to name source files with destination extensions
::Rack::Mime::MIME_TYPES[''] = 'text/html'

activate :blog do |blog|
  blog.prefix = ""
  blog.sources = "/writing/{year}/{month}-{day}-{title}"
  blog.default_extension = ".md"
  blog.summary_separator = /READMORE/
  blog.summary_length = 250

  blog.layout = "writing"

  blog.calendar_template = "writing/calendar.html"

  # that MIME_TYPE trick above won't add a destination extension, so we will
  blog.permalink = "/{year}/{month}/{day}/{title}.html"
  blog.year_link = "/{year}/index.html"
  blog.month_link = "/{year}/{month}/index.html"
  blog.day_link = "/{year}/{month}/{day}/index.html"

  blog.custom_collections = {
    category: {
      link: '/archive/{category}.html',
      template: 'writing/category.html'
    }
  }
end

page "/*/*", layout: :page
page "/feed/*", layout: false
page "/archive/*", layout: :page

page "/about/*", layout: :page
page "/library/*", layout: :page
page "/projects/*", layout: :page
page "/site/*", layout: :page


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
