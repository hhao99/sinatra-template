require 'rubygems'
require 'bundler/setup'
require 'ostruct'
require 'dotenv'

require 'sinatra' unless defined?(Sinatra)

Dotenv.load

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Sinatra Application Template',
                 :app_bamne => "Sinatra Application",
                 :author => 'Eric Hao',
                 :url_base => 'http://localhost:9292/'
               )

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

end
