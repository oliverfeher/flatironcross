class UsersController < ApplicationController

    get "/sign_up" do
        erb :sign_up
    end

    get "/login" do
        erb :"/users/login"
    end

    get "/logout" do
        logout!
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

    get "/users/index/:id" do
        @current_user = User.find_by(email: session[:email])
        erb :"/users/index"
    end

end