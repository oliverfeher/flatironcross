require_relative "./config/environment"
require "./config/environment"

use EmployeeController
use UsersController
use AppointmentsContoller
use Rack::MethodOverride
run ApplicationController