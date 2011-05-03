class InsuranceTransaction < ActiveRecord::Base
belongs_to :user
def self.search(search)
    if search
      where(:company.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end


 #validations
  validates_presence_of :user_id
  validates_presence_of :company
  validates_numericality_of :premium_amount, :only_integer => true



end
