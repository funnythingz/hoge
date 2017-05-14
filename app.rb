require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    slim :home, layout: :app
  end

  run! if app_file == $0
end
