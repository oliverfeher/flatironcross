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
        @current_employee = Employee.find_by(email: session[:email])
        @med = Medicine.new
        @med.user_id = params[:patient]
        @med.rx_name = params[:rx]
        @med.pill_count = params[:pill_count]
        @med.pill_size = params[:pill_size]
        @med.employee_id = @current_employee.id
        @med.save
        @patient = User.all.find_by(id: params[:patient]).detail
        @patient.medicine_id = @med.id
        @patient.save
        redirect "/employee/#{@current_employee.id}/index"
    end

    get "/employee/:id/edit" do
        @current_employee = Employee.find_by(email: session[:email])
        erb :"/employee/edit"
    end

    patch "/employee/:id/edit" do
        @current_employee = Employee.find_by(email: session[:email])
        if @current_employee.authenticate(params[:password])
            @current_employee = Employee.find_by(email: session[:email])
            @current_employee.name = params[:full_name]
            @current_employee.email = params[:email]
            @current_employee.experience = params[:experience]
            @current_employee.speciality = params[:speciality]
            @current_employee.save
            redirect "employee/#{@current_employee.id}/index"
        else
            redirect "/employee/:id/edit"
        end
    end

end