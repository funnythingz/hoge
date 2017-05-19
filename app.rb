require 'sinatra/base'
require 'sinatra/reloader'
require 'sprockets'
require 'sprockets-helpers'

class App < Sinatra::Base

  set :assets, Sprockets::Environment.new(root)

  configure do
    assets.append_path File.join(root, 'assets', 'css')
    assets.append_path File.join(root, 'assets', 'js')
    assets.append_path File.join(root, 'assets', 'images')

    Sprockets::Helpers.configure do |config|
      config.environment = assets
      config.prefix      = '/assets'
      config.digest      = true
    end
  end

  configure :development do
    register Sinatra::Reloader
  end

  helpers do
    include Sprockets::Helpers
  end

  get '/' do
    slim :home, layout: :app
  end

  run! if app_file == $0
end
