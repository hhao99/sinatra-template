require File.join(File.dirname(__FILE__), 'boot.rb')
require File.join(File.dirname(__FILE__), 'application.rb')

# controllers

map ('/admin') { run AdminApp }
map ('/api') { run ApiApp }
map ('/') { run SiteApp }
