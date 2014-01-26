require_relative '../../app'
require_relative '../test_helper'
require 'test/unit'
require 'rack/test'

class SmartmixesTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Smartmixes.new
  end

  def test_root
    get '/'
    assert_equal true, last_response.body.include?('Nome do Servidor')
  end

  def test_about
    get '/sobre'
    assert_equal true, last_response.body.include?('Organização')
  end
end
