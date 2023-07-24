class SiteApp < App 
    configure do 
        set :layout => 'site_layout'.to_sym
    end

    get '/' do
        @users = User.all
        erb :index
    end

    get '/about' do
        erb :about
    end
end
