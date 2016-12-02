class PValue < ApplicationRecord
  belongs_to :measurement
  before_save :calculate_value

  private
  def calculate_value
    meas = find_meas_by_type
    binding.pry
    lms = find_lms
    z = calculate_z_score(lms, meas)
    Distribution::Normal.cdf(z)
  end

  def find_lms
    LmsRef.find_by_measurement(measurement)
  end

  def calculate_z_score(lms, meas) #as described in http://www.who.int/childgrowth/standards/
    z_ind = ( ( ( meas / lms.m ) ** lms.l ) - 1 ) / ( lms.s * lms.l)
  end

  def find_meas_by_type
    case type_of_measurement
    when "weight_for_age" then measurement.weight
    when "length_for_age" then measurement.length
    end
  end


end
