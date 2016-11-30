class Measurement < ApplicationRecord
  has_many :p_values, dependent: :destroy
  belongs_to :chart

  def age_on_date
    start_time = chart.birth_day
    TimeDifference.between(start_time, self.date)
  end
end
