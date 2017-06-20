require 'bundler'
Bundler.require

class App < Sinatra::Base

  set :assets, Sprockets::Environment.new(root)

  configure do
    assets.append_path File.join(root, 'assets', 'css')
    assets.append_path File.join(root, 'assets', 'js')
    assets.append_path File.join(root, 'assets', 'images')
    assets.append_path File.join(root, 'assets', 'fonts')

    Sprockets::Helpers.configure do |config|
      config.environment = assets
      config.prefix      = '/assets'
      config.manifest    = Sprockets::Manifest.new(assets, 'manifset.json')
      config.digest      = true
      config.public_path = '/public'
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
