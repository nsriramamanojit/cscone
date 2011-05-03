class CreateBiddingZones < ActiveRecord::Migration
  def self.up
    create_table :bidding_zones do |t|
      t.string :name,:null=>false,:length=>100
      t.integer :state_id,:null=>false
      t.text :description,:length=>2000
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :bidding_zones
  end
end

