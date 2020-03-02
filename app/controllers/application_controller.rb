class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, "public"   #responsible for setting root directory to be app/views for erb rendering
        set :views, "app/views"

        enable :sessions
        set :session_secret, "loginpractice"
    end

    get "/" do
        erb :index
    end

    get "/sign_up" do
        erb :sign_up
    end

    post "/users" do
        binding.pry
    end
    
    get "/employee" do
        erb :employee
    end
end