class Banking < ActiveRecord::Base
#Relations
belongs_to :account_type
belongs_to :user
belongs_to :vle_representative_profile

 #Search
 def self.search(search)
    if search
      where(:account_number.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end
  
  #validations
  validates_presence_of :bank_name
  validates_presence_of :account_type
  validates_presence_of :name_of_holder
  validates_numericality_of :account_number, :only_integer => true

  
end

