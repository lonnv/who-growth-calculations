class CreatePValues < ActiveRecord::Migration[5.0]
  def change
    create_table :p_values do |t|
      t.string :type_of_measurement
      t.integer :score
      t.references :measurement

      t.timestamps
    end
  end
end
