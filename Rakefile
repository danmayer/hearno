#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'coverband'

Hearno::Application.load_tasks

desc "report unused lines"
task :coverband do
  baseline = JSON.parse(File.read('./tmp/coverband_baseline.json'))
  # merge more {'/Users/danmayer/projects/cover_band_server/app.rb' => Array.new(31,1)}
  root_paths = ['/app/']
  coverband_options = {:existing_coverage => baseline, :roots => root_paths}
  Coverband::Reporter.report(Redis.new(:host => 'utils.picoappz.com', :port => 49182, :db => 2), coverband_options)
end

desc "get coverage baseline"
task :coverband_baseline do
  Coverband::Reporter.baseline {
    require File.expand_path("../config/environment", __FILE__)
  }
end
