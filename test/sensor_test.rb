require_relative 'test_helper'
require_relative '../lib/sensor'

class SensorTest < Minitest::Test
  def test_it_has_a_type
    s = Sensor.new({type: "hygrometer", expected_value: "12.4", measured_value: "12"})
    s2 = Sensor.new({type: "thermometer", expected_value: "75.4", measured_value: "73"})

    assert_equal "hygrometer", s.type
    assert_equal "thermometer", s2.type
  end

  def test_it_has_expected_value
    s = Sensor.new({type: "hygrometer", expected_value: "12.4", measured_value: "12"})

    assert_equal "12.4", s.expected_value
  end

  def test_it_has_measured_value
    s = Sensor.new({type: "hygrometer", expected_value: "12.4", measured_value: "12"})

    assert_equal "12", s.measured_value
  end

  def test_it_can_calculate_grade
    s = Sensor.new({type: "hygrometer", expected_value: "12.4", measured_value: "12"})
    s2 = Sensor.new({type: "thermometer", expected_value: "12.4", measured_value: "-12"})

    assert_equal 0.4, s.calculate_grade
    assert_equal 24.4, s2.calculate_grade
  end

  def test_it_knows_hygrometer_grades
    s = Sensor.new({type: "hygrometer", expected_value: "12.4", measured_value: "12"})
    s2 = Sensor.new({type: "hygrometer", expected_value: "15", measured_value: "21"})
    s3 = Sensor.new({type: "hygrometer", expected_value: "12", measured_value: "30"})

    assert_equal "Pro", s.grade
    assert_equal "Prosumer", s2.grade
    assert_equal "Discount", s3.grade
  end

  def test_it_knows_thermometer_grades
    s = Sensor.new({type: "thermometer", expected_value: "75", measured_value: "76.5"})
    s2 = Sensor.new({type: "thermometer", expected_value: "66", measured_value: "75"})
    s3 = Sensor.new({type: "thermometer", expected_value: "70", measured_value: "59"})

    assert_equal "Pro", s.grade
    assert_equal "Prosumer", s2.grade
    assert_equal "Discount", s3.grade
  end
end