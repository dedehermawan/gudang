class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :unit
  self.primary_key = 'item_id'
  validates :item_name, presence: true
  validates :brand_id, presence: true
  validates :unit_id, presence: true
  validates :category_usage, presence: true
  validates :category_item, presence: true
end
