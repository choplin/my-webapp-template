require 'rack-livereload'
require_relative 'app'

if ENV['RACK_ENV'] != 'production'
  use Rack::LiveReload, :min_delay => 500
end

run App.new
