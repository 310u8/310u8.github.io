###
# Blog settings
###

Time.zone = "Tokyo"

activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = "{title}.html"
  blog.sources = "{title}.html"
  blog.layout = "layout"
  blog.summary_separator = /(READMORE)/
  blog.tag_template = "tag.html"
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
page "/blog/*", :layout => "blog"

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :layouts_dir, 'layouts'
set :partials_dir, 'partials'

set :slim, { :format => :html5 }

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = false
  config.inline   = true
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
end
