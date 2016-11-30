class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.date :date
      t.float :weight
      t.integer :length

      t.timestamps
    end
  end
end
