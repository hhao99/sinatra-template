class SiteApp < App 
    configure do 
        set :layout => 'site_layout'.to_sym
    end

    get '/' do
        erb :index
    end

    get '/about' do
        erb :about
    end
end
