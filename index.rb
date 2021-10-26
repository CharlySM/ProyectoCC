require 'mongo'
require 'sinatra'
require 'io/console'
require 'json'
require './src/User'
require './src/Utils'
require './src/Equipo'

set :bind, "0.0.0.0"
set :port, 80

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
collection = client["users"]
@data=" "

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
  estaEmail=Utils.searchIntoJson("email", params[:email], Utils.getCollection(collection))
  estaNameUser=Utils.searchIntoJson("user_name", params[:userName], Utils.getCollection(collection))

  if valid and !estaEmail and !estaNameUser
    id=collection.count
    doc=user.params_to_doc(id+1)
    collection.insert_one(doc)
    redirect '/'
  else
    redirect 'registroErroneo'
  end
end

get '/registroErroneo' do
    status 404
    body "Email erroneo o nombre usuario repetido"
end

post '/login' do
  erb :login
end

post '/logueando' do
  user=User.new(params[:nombre], params[:email], params[:password], params[:userName])
  valid=user.valid_email? ? true : false
  estaEmail=Utils.searchIntoJson("email", params[:email], Utils.getCollection(collection))
  estaPass=Utils.searchIntoJson("password", params[:password], Utils.getCollection(collection))
  if valid and estaEmail and estaPass
    redirect '/Principal'
  else
    redirect 'loginErroneo'
  end
end

get '/loginErroneo' do
    status 404
    body "Email erroneo o password erronea"
end

get '/Principal' do
  erb :principal
end

post '/equipoStatistics' do
  @data = Equipo.new(Utils.getJson("./jsonTest/equipo.json")["equipo"]).statisticToJson
  erb :principal
end

post '/manyStatistics' do
  equipos=Utils.getJson("./jsonTest/prueba2.json")
  aux=""
  equipos.map do |k,v|
    aux=aux+"#{k}:<br>"+"#{Equipo.new(v).statisticToJson}<br>"
  end
  @data=aux
  erb :principal
end
