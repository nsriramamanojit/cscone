class VleRepresentativeProfile < ActiveRecord::Base
  #Relations	
  has_many :vle_documents
  has_many :bankings
  belongs_to :user
  belongs_to :state
  belongs_to :bidding_zone
  belongs_to :district
  belongs_to :csc_block
  
  
  
  #search
  def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end
  
  #validations

 
  validates_presence_of :state_id
  validates_presence_of :bidding_zone_id
validates_presence_of :bidding_zone_id
validates_presence_of :district_id
validates_presence_of :csc_block_id
 

end
