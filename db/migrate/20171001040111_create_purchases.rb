class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases, :id => false do |t|
      t.primary_key :purchase_id, :string
      t.references :supplier, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
