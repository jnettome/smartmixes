require_relative '../test_helper'
require_relative '../../models/server'


# require 'minitest/autorun'

describe Server do
  before do
    @server = Server.new
  end

  describe "checking if server is alive" do
    it "respond with true" do
      assert_equal true, @server.alive?
    end
  end
end
