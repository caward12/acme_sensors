require './lib/sensor'

class SensorRepo

  attr_reader :all

  def initialize(file)
    @all = []
    create_sensors(file)
  end

  def create_sensors(file)
    file.map do |row|
      all << Sensor.new(row)
    end
  end

  def hygrometers
    all.select do |sensor|
      sensor.type == "hygrometer"
    end
  end

  def hygrometers_grade_count(grade)
    hygrometers.count{|sensor| sensor.grade == grade}
  end

  def thermometers
    all.select do |sensor|
      sensor.type == "thermometer"
    end
  end

  def thermometers_grade_count(grade)
    thermometers.count{|sensor| sensor.grade == grade}
  end

  def thermometer_output
    "\n Thermometers:
    #{thermometers_grade_count("Pro")} Pro
    #{thermometers_grade_count("Prosumer")} Prosumer
    #{thermometers_grade_count("Discount")} Discount"
  end

  def hygrometers_output
    "\n Hygrometers:
    #{hygrometers_grade_count("Pro")} Pro
    #{hygrometers_grade_count("Prosumer")} Prosumer
    #{hygrometers_grade_count("Discount")} Discount"
  end

  def summary(file)
    if thermometers.count > 0 && hygrometers.count > 0
      puts "\n #{File.basename(file)}" + thermometer_output + hygrometers_output
    elsif hygrometers.count > 0
      puts "\n #{File.basename(file)} \n No Thermometers" + hygrometers_output
    else
      puts "\n #{File.basename(file)}" + thermometer_output + "\n No Hygrometers"
    end
  end

end