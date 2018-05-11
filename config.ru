require './config/environment'

use Rack::MethodOverride
use UserController
use ReviewController
use OperatingSystemController
run ApplicationController
