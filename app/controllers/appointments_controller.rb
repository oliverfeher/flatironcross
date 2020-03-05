class AppointmentsContoller < ApplicationController

    get "/users/:id/book" do
        @current_user = User.find_by(email: session[:email])
        erb :"appointments/book"
    end

    post "/appointment" do
        binding.pry
        @current_user = User.find_by(email: session[:email])
        @appointment = Appointment.new
        @appointment.symptoms = params[:symptoms]
        @appointment.apt_date = params[:date]
        @appointment.reason = params[:reason]
        @appointment.full_name = params[:full_name]
        @appointment.employee_id = params[:doctor].to_i
        @appointment.user_id = @current_user.id
        @appointment.save
        redirect "/login"
    end

    get "/appointments/:id/pending" do
        @current_employee = Employee.find_by(email: session[:email])
        @appointments = Appointment.all.select { |x| x.employee_id == @current_employee.id}
        erb :"/appointments/pending"
    end
end