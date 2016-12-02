class AddMeasurement
  def call(args)
    unless measurement_already_added?(args)
      measurement = create_measurement(args)
      create_p_values(measurement)
      send_confirmation
    end
  end

  private

  def measurement_already_added?(args)
    Measurement.exists?(date: args[:date])
  end

  def create_measurement(args)
    Measurement.create(args[:measurement])
    binding.pry
  end

  def create_p_values(measurement)
    #create weight for age
    PValue.create(type_of_measurement: "weight_for_age", measurement: measurement)
  end

  def send_confirmation

  end

end
