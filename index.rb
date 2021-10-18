require 'mongo'
require 'sinatra'
require 'io/console'
require 'json'
require './src/User'
require './src/Utils'

set :bind, "0.0.0.0"
set :port, 80

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
collection = client["users"]

Utils=Utils.instance

get '/' do
  erb :index
end

get '/registro' do
  erb :registro
end

post '/registrado' do
  user=User.new(params[:nombre], params[:email], params[:password], params[:userName])
  valid=user.valid_email? ? true : false
  esta=Utils.searchIntoJson(params[:email], Utils.getCollection(collection))
  if valid and !esta
    id=collection.count
    doc=user.params_to_doc(id+1)
    collection.insert_one(doc)
    redirect '/'
  else
    redirect 'emailErroneo'
  end
end

get '/emailErroneo' do
    status 404
    body "Email erroneo "
end
