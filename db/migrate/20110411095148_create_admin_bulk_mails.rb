class CreateAdminBulkMails < ActiveRecord::Migration
  def self.up
    create_table :admin_bulk_mails do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_bulk_mails
  end
end
