require './index.rb'
require 'etcdv3'


::Logger.class_eval { alias :write :'<<' }
  access_log = ::File.join(::File.dirname(::File.expand_path(__FILE__)),'log','access.log')
  access_logger = ::Logger.new(access_log)
  error_logger = ::File.new(::File.join(::File.dirname(::File.expand_path(__FILE__)),'log','error.log'),"a+")
  error_logger.sync = true

  configure do
    use ::Rack::CommonLogger, access_logger
  end

  before {
    env["rack.errors"] =  error_logger
  }

  conn = Etcdv3.new(endpoints: 'http://127.0.0.1:2379')
  puts "port: #{conn.get("SinatraPort")}"

run Sinatra::Application
