class EmployeeController < ApplicationController

    # set :views, "app/views/employee"

    get "/employee/login" do
        erb :"/employee/login"
    end

    get "/employee/index" do
        erb :"/employee/index"
    end


end