class CreateCscBlocks < ActiveRecord::Migration
  def self.up
    create_table :csc_blocks do |t|
      t.string :name,:null=>false,:length=>100
      t.text :description,:length=>2000
      t.integer :state_id,:null=>false
      t.integer :bidding_zone_id,:null=>false
      t.integer :district_id,:null=>false
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

  end

  def self.down
    drop_table :csc_blocks
  end
end

