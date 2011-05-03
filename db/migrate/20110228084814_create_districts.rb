class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.string :name,:null=>false,:length=>100
      t.integer :bidding_zone_id,:null=>false
      t.integer :state_id,:null=>false
      t.text :description,:length=>2000
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

  end

  def self.down
    drop_table :districts
  end
end

