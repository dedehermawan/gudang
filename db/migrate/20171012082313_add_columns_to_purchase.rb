class AddColumnsToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :coa, foreign_key: true
    add_reference :purchases, :division, foreign_key: true
    add_column :purchases, :document_date, :date
    add_column :purchases, :use_date, :date
  end
end
