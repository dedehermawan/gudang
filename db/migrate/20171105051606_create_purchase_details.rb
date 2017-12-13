class CreatePurchaseDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_details do |t|
      t.integer :qty_purchase

      t.timestamps
    end
  end
end
