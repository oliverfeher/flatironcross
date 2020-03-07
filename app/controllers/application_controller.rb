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

    get "/contact" do
        erb :contact
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

        def login_employee(email, password)
            # check if the user exits, if so set session, else redirect
           employee = Employee.find_by(email: email) #find user by email 
           if employee && employee.authenticate(password) #if user exists and autenticates the password set the session
               session[:email] = employee.email
           else
               redirect "/employee/login"
           end
       end

       def current_employee
           @current_employee ||= Employee.find_by(email: session[:email]) if session[:email]
       end

        def logged_in?
            !!current_user
        end

        def employee_logged_in?
            !!current_employee
        end

        def add_account
            if logged_in?
                "/account"
            end
        end


        def add_log_out_button
            if logged_in? || employee_logged_in?
                "<a class='nav-link' href='/logout' id='log-out-button'><li>log out</li></a>"
            end
        end

        def logout!
            session.clear
            redirect "/"
        end

        def add_user_detail_form
            "
            <p id='p_prof'>PATIENT'S <span>INFORMATION:</span></p>
            <div class='imgcontainer'>
                <img src='/patient.svg' alt='Avatar' class='avatar'>
            </div>

            <div class='container'>
                <label class='full_name' for='full_name'><b>Full name:</b></label>
                <input class='full_name' type='text' placeholder='Enter first and last name..' name='full_name' required>
                
                <label class='dob' for='dob'><b>Date of birth:</b></label>
                <input class='dob' type='date' name='dob' required>
                
                <label class='gender' for='gender'><b>Gender:</b></label>
                <select name='gender' form='details' id='gender'>
                    <option value='Female'>Female</option>
                    <option value='Male'>Male</option>
                    <option value='other'>Other</option>
                </select>

                <label class='address' for='address'><b>Address:</b></label>
                <input type='text' class='address' placeholder='Enter address..' name='address' required>

                <label class='phone_number' for='phone_number'><b>Phone number:</b></label>
                <input class='phone_number' type='text' placeholder='Enter your phonenumber..' name='phone_number' required>
        
                <button type='submit'>Submit</button>
            </div>"
        end
    end
end