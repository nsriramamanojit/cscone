class District < ActiveRecord::Base
    belongs_to :bidding_zone
    belongs_to :state
    has_many :vle_representaive_profiles,:dependent=>:destroy
    has_many :csc_blocks,:dependent=>:destroy
     validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 100}
      validates :bidding_zone_id,:state_id, :presence => true
      validates :description, :length => { :maximum => 2000}
     def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end

end

