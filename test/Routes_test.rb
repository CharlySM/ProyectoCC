require './index.rb'
require 'minitest/autorun'
require 'rack/test'
require './test/Variables_test.rb'

class RoutesTest < Minitest::Test

  include Rack::Test::Methods

  def app
      Sinatra::Application
  end

  def test_default

    get '/'

   assert_equal getRaiz, last_response.body
 end

 def test_registro
   get '/registro'
   assert_equal getRegistro, last_response.body
 end

def test_registradoCorrecto
  browser = Rack::Test::Session.new(Rack::MockSession.new(app))
  browser.stub(:post, "") do
    assert_equal "", browser.post('/registrado')
  end
end

def test_registroErroneo
  get '/registroErroneo'
  assert_equal expectedRegistroErroneo, last_response.body
end

def test_login
  get '/login'
  assert_equal expectedLogin, last_response.body
end

def test_loginCorrecto
  browser = Rack::Test::Session.new(Rack::MockSession.new(app))
  browser.stub(:post, "") do
    assert_equal "", browser.post('/logueando')
  end
end

def test_loginErroneo
  get '/loginErroneo'
  assert_equal expectedLoginErroneo, last_response.body
end

def test_principal
  get '/Principal'
  assert_equal expectedPrincipal, last_response.body
end

def test_equipoStatistics
  browser = Rack::Test::Session.new(Rack::MockSession.new(app))
  browser.stub(:post, "") do
    assert_equal "", browser.post('/equipoStatistics')
  end
end

def test_manyStatistics
  browser = Rack::Test::Session.new(Rack::MockSession.new(app))
  browser.stub(:post, "") do
    assert_equal "", browser.post('/manyStatistics')
  end
end

end
