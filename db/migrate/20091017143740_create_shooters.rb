class CreateShooters < ActiveRecord::Migration
  def self.up
    create_table :shooters do |t|
      t.string :name
      t.string :shortcode_url

      t.timestamps
    end
  end

  def self.down
    drop_table :shooters
  end
end
