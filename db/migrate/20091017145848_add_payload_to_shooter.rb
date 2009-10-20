class AddPayloadToShooter < ActiveRecord::Migration
  def self.up
    add_column :shooters, :payload, :text
  end

  def self.down
    remove_column :shooters, :payload
  end
end
