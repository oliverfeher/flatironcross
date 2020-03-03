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