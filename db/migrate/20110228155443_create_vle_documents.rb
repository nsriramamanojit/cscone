class CreateVleDocuments < ActiveRecord::Migration
 def self.up
    create_table :vle_documents do |t|
      t.integer :user_id,:null=>false
      t.string :agreement_paper
      t.boolean :address_proof
      t.boolean :education_proof
      t.boolean :photograph_proof
      t.string :dd_number
      t.date :dd_date
      t.string :dd_bank_name
      t.string :dd_branch_name
      t.integer :dd_amount
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

  end

  def self.down
    drop_table :vle_documents
  end
end

