class CreateBulkVleMails < ActiveRecord::Migration
  def self.up
    create_table :bulk_vle_mails do |t|
      t.text :mail_subject
      t.text :mail_body
      t.integer :district_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bulk_vle_mails
  end
end
