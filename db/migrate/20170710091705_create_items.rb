class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items, :id => false do |t|
      t.primary_key :item_id, :string, limit: 4
      t.string :item_name
      t.references :brand, foreign_key: true
      t.references :unit, foreign_key: true
      t.boolean :active
      t.integer :category_usage
      t.integer :category_item

      t.timestamps
    end
  end
end
