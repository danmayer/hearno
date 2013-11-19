# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'coverband'

use Coverband::Middleware, :root => Dir.pwd,
          :reporter => Redis.new(:host => 'utils.picoappz.com', :port => 49182, :db => 2),
	  :ignore => ['vendor'],
	  :percentage => 60.0

run Hearno::Application
