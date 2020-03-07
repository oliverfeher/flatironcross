class AppointmentsContoller < ApplicationController

    get "/users/:id/book" do
        @current_user = User.find_by(email: session[:email])
        erb :"appointments/book"
    end

    post "/appointment" do
        @current_user = User.find_by(email: session[:email])
        @appointment = Appointment.new
        @appointment.symptoms = params[:symptoms]
        @appointment.apt_date = params[:date]
        @appointment.reason = params[:reason]
        @appointment.full_name = params[:full_name]
        @appointment.employee_id = params[:doctor].to_i
        @appointment.user_id = @current_user.id
        @appointment.status = "pending"
        @appointment.save
        redirect "/login"
    end
 
    get "/employee/:id/appointments/edit" do
        @current_employee = Employee.find_by(email: session[:email])
        @appointments = Appointment.all.select { |x| x.employee_id == @current_employee.id }
        @pending_apts = @appointments.select { |x| x.status == "pending"}
        erb :"/appointments/edit"
    end

    post "/appointment/update" do
        @current_employee = Employee.find_by(email: session[:email])
        @appointment = Appointment.all.find_by(id: params.first[0])
        @appointment.status = "confirmed"
        @appointment.save
        redirect "/employee/#{@current_employee.id}/appointments/edit"
    end

    post "/appointment/delete" do
        @current_employee = Employee.find_by(email: session[:email])
        @appointment = Appointment.all.find_by(id: params.first[0])
        @appointment.destroy
        redirect "/employee/#{@current_employee.id}/appointments/edit"
    end

end