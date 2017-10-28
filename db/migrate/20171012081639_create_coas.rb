class CreateCoas < ActiveRecord::Migration[5.0]
  def change
    create_table :coas do |t|
      t.string :coa_id
      t.string :coa_name

      t.timestamps
    end
  end
end
