class AddActiveToShooter < ActiveRecord::Migration
  def self.up
    add_column :shooters, :active, :boolean
  end

  def self.down
    remove_column :shooters, :active
  end
end
