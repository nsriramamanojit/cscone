class CreateVleRepresentativeProfiles < ActiveRecord::Migration
  def self.up
    create_table :vle_representative_profiles do |t|

      t.integer :user_id
      t.integer :state_id
      t.integer :bidding_zone_id
      t.integer :district_id
      t.integer :csc_block_id
      t.string :father_name
      t.string :address
      t.string :pincode
      t.date :date_of_birth
      t.string :csc_panchayat
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :vle_representative_profiles
  end
end
