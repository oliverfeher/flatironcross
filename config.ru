require_relative "./config/environment"
require "./config/environment"

use AppointmentsContoller
use Rack::MethodOverride
run ApplicationController