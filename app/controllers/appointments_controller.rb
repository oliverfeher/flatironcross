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
        @appointment.employee_id = params[:doctor].to_i
        @appointment.user_id = @current_user.id
        @appointment.status = "pending"
        @appointment.save
        redirect "/login"
    end
end