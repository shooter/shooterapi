class CreateListeners < ActiveRecord::Migration
  def self.up
    create_table :listeners do |t|
      t.string :name
      t.string :shortcode_url

      t.timestamps
    end
  end

  def self.down
    drop_table :listeners
  end
end
