class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.string :division_id
      t.string :division_name

      t.timestamps
    end
  end
end
