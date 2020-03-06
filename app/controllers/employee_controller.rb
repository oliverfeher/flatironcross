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

    get "/employee/:id/index" do #index not necessary
        @current_employee = Employee.find_by(email: session[:email])
        erb :"/employee/index"
    end

    get "/appointment/select/:id" do
        @detail = Appointment.all.find_by(id: params[:id])
        json @detail
    end

    post "/employee/:id/appointment" do
        @current_employee = Employee.find_by(email: session[:email])
        @appointment = Appointment.all.find_by(id: params[:id]) 
        redirect "/employee/#{@current_employee.id}/appointment/#{@appointment.id}"
    end

    get "/employee/:id/prescribe" do
        @current_employee = Employee.find_by(email: session[:email])
        @patients = User.all

        erb :"/employee/prescribe"
    end

    post "/employee/:id/prescribe" do
        binding.pry
    end

end