class Purchase < ApplicationRecord
  belongs_to :supplier
  self.primary_key = 'purhase_id'

  def self.search(search)
    if search
      where('purchase_id LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
