ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'

# require_relative '../test_helper'
# require_relative '../../models/user'

# describe User do
#   before do
#     @user = User.new
#   end

#   describe "saying hi" do
#     it "respond with hi" do
#       assert_equal "hi", @user.say_hi
#     end
#   end
# end

# require_relative '../../app'
# require_relative '../test_helper'
# require 'test/unit'
# require 'rack/test'

# class MyAppTest < Test::Unit::TestCase
#   include Rack::Test::Methods

#   def app
#     MyApp.new
#   end

#   def test_root
#     get '/'
#     assert_equal true, last_response.body.include?('Sinatra template')
#   end
# end
