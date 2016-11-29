class CreateLmsRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :lms_refs do |t|
      t.boolean :male
      t.boolean :time_in_months
      t.integer :time_amount
      t.float :l
      t.float :m
      t.float :s

      t.timestamps
    end
  end
end
