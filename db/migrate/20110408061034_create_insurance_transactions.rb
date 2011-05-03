class CreateInsuranceTransactions < ActiveRecord::Migration
  def self.up
    create_table :insurance_transactions do |t|
      t.integer :user_id,:null=>false
      t.integer :policy_number
      t.string :company
      t.string :policy_name
      t.integer :premium_amount
      t.string :remarks
      t.date :date
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :insurance_transactions
  end
end
