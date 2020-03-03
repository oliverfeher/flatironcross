class EmployeeController < ApplicationController

    # set :views, "app/views/employee"

    get "/employee" do
        erb :"/employee/index"
    end


end