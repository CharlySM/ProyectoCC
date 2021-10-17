require 'mongo'
require 'sinatra'
require 'io/console'
require 'json'

set :bind, "0.0.0.0"

get '/' do
  erb :index
end
