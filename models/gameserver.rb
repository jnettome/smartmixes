class Gameserver < ActiveRecord::Base
  @ip_regex = /([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}/

  validates :ip,
            presence: true,
            format: { with: @ip_regex }

  def alive?
    true
  end
end
