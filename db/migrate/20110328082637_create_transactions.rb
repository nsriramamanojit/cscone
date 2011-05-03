class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :user_id,:null=>false
      t.string :bank_name
      t.integer :account_number
      t.string :mode_of_transaction
      t.decimal :amount
      t.date :date 
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
