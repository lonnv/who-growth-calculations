class AddChartReferenceToMeasurement < ActiveRecord::Migration[5.0]
  def change
    add_reference :measurements, :chart, index: true
  end
end
