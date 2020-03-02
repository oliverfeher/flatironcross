class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, "public"   #responsible for setting root directory to be app/views for erb rendering
        set :views, "app/views"

        enable :sessions
        set :session_secret, "flatironcross"
    end

    get "/" do
        erb :index
    end

    get "/sign_up" do
        erb :sign_up
    end

    get "/login" do
        erb :login
    end

    post "/users" do
        @user = User.new(email: params[:email], password: params[:password])
        if @user.save
            redirect "/login"
        else
            redirect "/signup"
        end
    end
    
    get "/employee" do
        erb :employee
    end
end