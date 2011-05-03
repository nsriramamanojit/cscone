class State < ActiveRecord::Base
    has_many :bidding_zones,:dependent=>:destroy
        has_many :districts,:dependent=>:destroy
        has_many :csc_blocks,:dependent=>:destroy
         has_many :vle_representative_profiles,:dependent=>:destroy
        validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 100}
        validates :description, :length => { :maximum => 2000}
    def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end
end

