class SiteApp < App 
    configure do 
        set :layout => 'site_layout'.to_sym
    end

    get '/' do
        @title = "Sinatra Application"
        @users = User.all
        slim :index
    end

    get '/about' do
        slim :about
    end
end
