require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    slim :home, layout: :app
  end

  run! if app_file == $0
end
