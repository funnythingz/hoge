require 'sprockets'
require './app'

map '/assets' do
  run App.assets
end

run App
