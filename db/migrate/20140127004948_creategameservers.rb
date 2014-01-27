class Creategameservers < ActiveRecord::Migration
  def change
    create_table :gameservers do |t|
      t.string :ip
      t.string :port
      t.string :hostname
      t.string :players
      t.string :current_map
      t.datetime :last_ping_at
    end
  end
end
