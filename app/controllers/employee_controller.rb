class EmployeeController < ApplicationController

    # set :views, "app/views/employee"

    get "/employee/login" do
        if employee_logged_in?
            redirect "/employee/#{current_employee.id}/index"
        else
            erb :"/employee/login"
        end
    end

    post "/employee" do
        login_employee(params[:email], params[:password])
        @current_employee = Employee.find_by(email: session[:email])
        redirect "/employee/#{@current_employee.id}/index"
    
    end

    get "/employee/:id/index" do
        @current_employee = Employee.find_by(email: session[:email])
        erb :"/employee/index"
    end


end