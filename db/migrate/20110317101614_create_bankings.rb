class CreateBankings < ActiveRecord::Migration
  def self.up
    create_table :bankings do |t|
      t.integer :user_id,:null=>false
      t.integer :account_type_id,:null=>false
      t.string :bank_name
      t.string :account_type
      t.integer:account_number
      t.string :name_of_holder
      t.string :father_name
      t.string  :address
      t.date :date
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :bankings
  end
end
