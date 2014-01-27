# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'rack-flash'

require_relative 'config/environments'
require_relative 'models/gameserver'

class Smartmixes < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions
  use Rack::Flash

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
    @servers = Gameserver.all.order('last_ping_at DESC')
    erb :index
  end

  post '/registrar' do
    server_ip = IPAddr.new(params[:ip])
    server = GoldSrcServer.new(server_ip, params[:port])
    server.init

    if @server = Gameserver.find_by_ip_and_port(params[:ip], params[:port])
      # 'IP já cadastrado ou inválido'
      @server.hostname = server.server_info[:server_name]
      @server.players = server.server_info[:number_of_players].to_s + '/' + server.server_info[:max_players].to_s
      @server.current_map = server.server_info[:map_name]
      @server.last_ping_at = Date.today
      @server.save!
    else
      # 'IP adicionado com sucesso!'
      @server = Gameserver.create(
        ip: params[:ip],
        port: params[:port].to_i,
        hostname: server.server_info[:server_name],
        players: server.server_info[:number_of_players].to_s + '/' + server.server_info[:max_players].to_s,
        current_map: server.server_info[:map_name],
        last_ping_at: Date.today)
    end

    redirect '/'
  end

  get '/sobre' do
    erb :about
  end
end
