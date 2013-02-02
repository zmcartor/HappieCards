require ::File.expand_path('../app',  __FILE__)
require 'bundler'
Bundler.require :assets

sprocket = Sprockets::Environment.new
sprocket.append_path 'public/javascript/'
sprocket.append_path 'public/javascript/app'
sprocket.append_path 'public/javascript/vendors'
sprocket.append_path 'public/javascript/vendors/backbone'
sprocket.append_path 'public/javascript/vendors/underscore'
sprocket.append_path 'public/css'

map '/javascript' do
  run sprocket
end

map '/css' do
  run sprocket
end

map '/' do
  run HappyCards
end
