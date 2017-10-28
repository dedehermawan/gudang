class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.boolean :active

      t.timestamps
    end
  end
end
