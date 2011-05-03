class CreatePremia < ActiveRecord::Migration
  def self.up
    create_table :premia do |t|
      t.string :name
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :premia
  end
end
