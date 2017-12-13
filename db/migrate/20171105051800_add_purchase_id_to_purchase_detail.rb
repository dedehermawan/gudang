class AddPurchaseIdToPurchaseDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :purchase_details, :purchase_id, :string
    add_index :purchase_details, :purchase_id
  end
end
