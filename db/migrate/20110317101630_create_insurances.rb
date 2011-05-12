class CreateInsurances < ActiveRecord::Migration
  def self.up
    create_table :insurances do |t|
      t.integer :user_id,:null=>false
      t.integer :policy_number
      t.string :name
      t.string :policy_name
      t.string :company_name
      t.integer:amount
      t.integer:premium_id,:null=>false
      t.integer :no_of_years
      t.string  :remarks
      t.date :date 
      t.integer :created_by
      t.integer :updated_by
      t.float :pre_amount
      t.timestamps
    end
  end

  def self.down
    drop_table :insurances
  end
end
