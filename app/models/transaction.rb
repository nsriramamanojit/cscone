class Transaction < ActiveRecord::Base
belongs_to :user
#search
 def self.search(search)
    if search
      where(:bank_name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end
  
  #validations
  validates_presence_of :bank_name

  validates_numericality_of :account_number, :only_integer => true
  validates_numericality_of :amount
  
end

