class Division < ApplicationRecord

  validates :division_id, presence: true
  validates :division_name, presence: true

end
