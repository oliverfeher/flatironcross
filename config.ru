require_relative "./config/environment"
require "./config/environment"

use Rack::MethodOverride
use EmployeeController
use UsersController
use AppointmentsContoller
run ApplicationController