class User < ActiveRecord::Base
 acts_as_authentic
  has_many :assignments
  has_many :bankings,:dependent=>:destroy
   has_many :insurances,:dependent=>:destroy
 has_many :insurance_transactions,:dependent=>:destroy
   has_many :transactions,:dependent=>:destroy
  has_many :roles, :through => :assignments
  has_one :vle_representative_profile
  accepts_nested_attributes_for :vle_representative_profile
  has_many :vle_documents
 validates :name,:presence => true
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end

  STATUS_TYPES = [
  #[ Displayed,stored in db]
  [ "On Hold" , "On Hold" ],
  [ "Approved" , "Approved" ],
  [ "Blocked" , "Blocked" ]
  ]

     def self.search(search)
    if search
      where(:name.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end
end

