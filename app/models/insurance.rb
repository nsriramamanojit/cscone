class Insurance < ActiveRecord::Base
belongs_to :premium
belongs_to :user
def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end


 #validations
  validates_presence_of :user_id
  validates_presence_of :premium_id
  validates_presence_of :name
  validates_numericality_of :no_of_years, :only_integer => true


end
