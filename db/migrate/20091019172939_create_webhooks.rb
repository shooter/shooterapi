class CreateWebhooks < ActiveRecord::Migration
  def self.up
    create_table :webhooks do |t|
      t.string :url
      t.integer :shooter_id

      t.timestamps
    end
  end

  def self.down
    drop_table :webhooks
  end
end
