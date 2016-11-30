class CreatePValues < ActiveRecord::Migration[5.0]
  def change
    create_table :p_values do |t|
      t.string :type
      t.integer :score
      t.reference :measurement

      t.timestamps
    end
  end
end
