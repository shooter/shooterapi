class CreateMufflers < ActiveRecord::Migration
  def self.up
    create_table :mufflers do |t|
      t.string :pattern
      t.integer :shooter_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mufflers
  end
end
