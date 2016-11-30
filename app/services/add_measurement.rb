class AddMeasurement

  def self.call(args)
    new(args).call
  end

  def call
    unless measurement_already_added?
      measurement = create_measurement
      create_p_values(measurement)
      send_confirmation
    end
  end

  private

  def measurement_already_added?
    Measurement.find(date: args[:date])
  end

  def create_measurement
    Measurement.create(args[:measurement])
  end

  def create_p_values(measurement)
    #create weight for age
    PValue.create(type: "weight_for_age", measurement: measurement)
  end

  def send_confirmation

  end

end
