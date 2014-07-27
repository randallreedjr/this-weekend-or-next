require './config/environment.rb'

use Rack::Static, :urls => ['/css', '/js'], :root => 'public'
use WeekendController
run ApplicationController