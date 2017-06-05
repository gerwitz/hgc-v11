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

set :markdown_engine, :kramdown
set :markdown, fenced_code_blocks: true,
               autolink: true,
               smartypants: true

activate :blog do |blog|
  blog.prefix = ""
  blog.sources = "/writing/{year}/{month}-{day}-{title}" # if this changes, adjust search below
  blog.default_extension = ".md"
  blog.summary_separator = /READMORE/
  blog.summary_length = 250

  blog.layout = "writing"

  blog.calendar_template = "writing/calendar.html"

  blog.permalink = "/{year}/{month}/{day}/{title}"
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

# page "/*/*", layout: :page
# page "/feed/*", layout: false
page "/archive/*", layout: :page

page "/about/*", layout: :page
page "/library/*", layout: :page
page "/projects/*", layout: :page
page "/site/*", layout: :page

activate :search do |search|
  search.resources = ['writing/', 'library/', 'projects/', 'site/']
  search.index_path = 'search.json'
  search.fields = {
    title:   {boost: 100, store: true, required: true},
    path:    {index: false, store: true},
    content: {boost: 50},
    url:     {index: false, store: true}
  }
  search.before_index = Proc.new do |to_index, to_store, resource|
    path = resource.path
    to_store[:path] = path
    path_split = path.split('/',2)
    section = path_split.first
    to_store[:section] = section
    if section == 'writing'
      date_parts = path_split[1].match(/(\d{4})\/(\d{2})-(\d{2})/) # must match blog.sources
      to_store[:date] = Date.parse(date_parts.to_s)
    end
  end
end

activate :sprockets

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

configure :development do
  require 'lib/rack_validate'
  use ::Rack::Validate
end
