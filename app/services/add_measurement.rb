class AddMeasurement

  def self.call(*args)
    new(*args).call
  end

  def call
    unless measurement_already_added?
      create_measurement
      create_p_values
      send_confirmation
    end
  end

  private

  def measurement_already_added?
    # ...
  end

  def create_measurement
    # ...
  end

  def create_p_values
    # ...
  end

  def send_confirmation

  end

end
