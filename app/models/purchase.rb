class Purchase < ApplicationRecord
#  belongs_to :supplier
  has_many :purchase_details, primary_key: "purchase_id"
  accepts_nested_attributes_for :purchase_details, :allow_destroy => true, :reject_if => :all_blank

  self.primary_key = 'purchase_id'

  def self.search(search)
    if search
      where('purchase_id LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
