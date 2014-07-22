require 'sinatra/base'
require 'slim'

class App < Sinatra::Base
  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  get '/' do
    slim :index
  end
end
