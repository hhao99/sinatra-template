require 'sinatra'

class App < Sinatra::Base
  helpers do
    def output(obj,status=200) 
      halt code, obj.to_json if obj.present
      return false
    end

    def debug 
      require 'pry-remote'; binding.remote_pry
    end
  end

  configure do
    set :views, "#{File.dirname(__FILE__)}/views"
    set :public_foler, 'public'
    set :show_exceptions, :after_handler
    enable :logging
    enable :sessions
    use Rack::Session::Pool
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
    also_reload 'models/*.rb'
  end

  before do
    puts 'request'
  end

  not_found do
    @title = "Not Found!"
    erb :not_found, :layout => :layout
  end

end