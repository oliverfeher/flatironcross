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

        def current_user
            @current_user ||= User.find_by(email: session[:email]) if session[:email]
        end

        def logged_in?
            !!current_user
        end

        def add_account
            if logged_in?
                "/account"
            end
        end

        def add_log_out_button
            if logged_in?
                "<a class='nav-link' href='/logout' id='log-out-button'><li>log out</li></a>"
            end
        end

        def logout!
            session.clear
            redirect "/"
        end
    end
end