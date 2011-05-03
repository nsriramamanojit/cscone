class Premium < ActiveRecord::Base
has_many :insurances,:dependent=>:destroy
def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end

######## Validations
 validates_presence_of :name
  


end
