ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
