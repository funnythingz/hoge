require 'bundler'
Bundler.require

class App < Sinatra::Base

  set :assets, Sprockets::Environment.new(root)
  set :assets_precompile, %w(app.js styles.sass *.png *.jpg *.svg *.eot *.ttf *.woff)
  set :manifest, Sprockets::Manifest.new(assets, 'public/assets/manifset.json')

  configure do
    assets.append_path File.join(root, 'assets', 'css')
    assets.append_path File.join(root, 'assets', 'js')
    assets.append_path File.join(root, 'assets', 'images')
    assets.append_path File.join(root, 'assets', 'fonts')

    Sprockets::Helpers.configure do |config|
      config.environment = assets
      config.prefix      = '/assets'
      config.manifest    = manifest
      config.digest      = true
      config.public_path = '/public'

      #TODO: precompileの仕組みをつくる
      manifest.compile(assets_precompile)
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
