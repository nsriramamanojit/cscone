class CscBlock < ActiveRecord::Base
    belongs_to :state
    belongs_to :bidding_zone
    belongs_to :district
    has_many :vle_representative_profiles,:dependent=>:destroy
     validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 100}
      validates :state_id,:bidding_zone_id,:district_id, :presence => true
      validates :description, :length => { :maximum => 2000}
      def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end

end

