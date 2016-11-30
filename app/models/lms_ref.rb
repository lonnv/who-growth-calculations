class LmsRef < ApplicationRecord
  def self.find_by_measurement(measurement)
    birth_day = measurement.chart.birth_day
    time_diff =  measurement.age_on_date #returns TimeDifference objct
    if time_diff.in_weeks.round <= 15
      lms_refs = LmsRef.where(time_in_months: false)
                       .where(time_amount: time_diff.in_weeks.round)
    else
      lms_refs = LmsRef.where(time_in_months: true)
                       .where(time_amount: time_diff.in_months.round)
    end

    lms_refs = lms_refs.where(male: measurement.chart.male)
    result = lms_refs.where("created_at <= ?", birth_day).order("created_at DESC").limit(1)
    result = lms_refs.where("created_at >= ?", birth_day).order("created_at ASC").limit(1) if result.empty?
    return result
  end
end
