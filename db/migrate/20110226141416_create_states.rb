class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name,:null=>false,:length=>100
      t.string :description,:length=>2000
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :states,:name,:unique => true
  end

  def self.down
    drop_table :states
  end
end

