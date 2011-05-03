class VleDocument < ActiveRecord::Base
    belongs_to :user
     validates :user_id, :presence => true
     def self.search(search)
    if search
      where(:agreement_paper.matches => "%#{search}%") #from meta_where gem
    else
      scoped
    end
  end

end

