class AccountType < ActiveRecord::Base
has_many :bankings,:dependent=>:destroy
def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end


#validations
  validates_presence_of :name
  
end
