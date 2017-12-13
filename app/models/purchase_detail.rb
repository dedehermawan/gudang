class PurchaseDetail < ApplicationRecord
  belongs_to :purchase, primary_key: "purchase_id", required: false
end
