require_relative '../test_helper'
require_relative '../../models/gameserver'

describe Gameserver do
  before do
    @server = Gameserver.new(ip: '127.0.0.1')
  end

  describe "checking if server is alive" do
    it "respond with true" do
      assert_equal true, @server.alive?
    end
  end

  describe "returning records" do
    it "respond to all" do
    end
  end
end
