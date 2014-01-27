class Gameserver < ActiveRecord::Base
  # validates_presence_of :name

  def alive?
    true
  end
end
