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
        erb :"/users/login"
    end

    post "/users/index/" do
        login(params[:email], params[:password])
        @current_user = User.find_by(email: session[:email])
        redirect "/users/index/#{@current_user.id}"
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

    get "/users/index/:id" do
        @current_user = User.find_by(email: session[:email])
        erb :"/users/index"
    end

    helpers do

        def login(email, password)
             # check if the user exits, if so set session, else redirect
            user = User.find_by(email: email) #find user by email 
            if user && user.authenticate(password) #if user exists and autenticates the password set the session
                session[:email] = user.email
            else
                redirect "/login"
            end
        end
    end
end