class PValue < ApplicationRecord
  belongs_to: :measurement
  before_save :calculate_value

  private
  def calculate_value
    lms = find_lms
  end

  def find_lms
    lms_refs = LmsRef.find_by_measurement(measurement)
  end
end
