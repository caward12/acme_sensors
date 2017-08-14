class Sensor

  attr_reader :type, :expected_value, :measured_value

  def initialize(data)
    @type = data[:type]
    @expected_value = data[:expected_value]
    @measured_value = data[:measured_value]
  end

  def calculate_grade
    (expected_value.to_f - measured_value.to_f).round(2)
  end

  def grade
    if type == "hygrometer"
      if (calculate_grade).abs <= 4
        "Pro"
      elsif (calculate_grade).abs <= 15
        "Prosumer"
      else
        "Discount"
      end
    else
      if (calculate_grade).abs <= 1.5
        "Pro"
      elsif (calculate_grade).abs <=10
        "Prosumer"
      else
        "Discount"
      end
    end
  end

end
