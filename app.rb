require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require_relative 'models/gameserver'

class Smartmixes < Sinatra::Base
  enable :method_override

  configure do
    set :app_file, __FILE__
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
  end

  # Routes
  get '/' do
    server_ip = IPAddr.new('200.98.169.211')
    server = GoldSrcServer.new(server_ip, 27028)
    server.init
    puts server.inspect
    erb :index
  end
end
