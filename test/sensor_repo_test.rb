require_relative 'test_helper'
require 'csv'
require_relative '../lib/sensor_repo'

class SensorRepoTest < Minitest::Test
  def test_it_knows_all_sensors_from_file
    opened = CSV.read("./data/hygrol.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    assert_instance_of Array, sr.all
    assert_equal 3, sr.all.count
  end

  def test_it_creates_sensors
    opened = CSV.read("./data/hygrol.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    assert_instance_of Sensor, sr.all.first
  end

  def test_it_groups_hygrometers
    opened = CSV.read("./data/hygrol.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    assert_equal 3, sr.hygrometers.count
  end

  def test_it_groups_thermometers
    opened = CSV.read("./data/therml.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    assert_equal 4, sr.thermometers.count
  end

  def test_it_can_group_thermometers_and_hygrometers_in_same_repo
    opened = CSV.read("./data/mix.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    assert_equal 3, sr.thermometers.count
    assert_equal 2, sr.hygrometers.count
  end

  def test_it_can_count_hygrometers_grade
    opened = CSV.read("./data/hygrol.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    assert_equal 2, sr.hygrometers_grade_count("Pro")
    assert_equal 1, sr.hygrometers_grade_count("Prosumer")
    assert_equal 0, sr.hygrometers_grade_count("Discount")
  end

  def test_it_can_count_thermometers_grade
    opened = CSV.read("./data/therml.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    assert_equal 1, sr.thermometers_grade_count("Pro")
    assert_equal 0, sr.thermometers_grade_count("Prosumer")
    assert_equal 3, sr.thermometers_grade_count("Discount")
  end

  def test_it_can_summarize_file
    opened = CSV.read("./data/therml.csv", headers: true, header_converters: :symbol)
    sr = SensorRepo.new(opened)

    output =  "\n therml.csv\n Thermometers:
    1 Pro
    0 Prosumer
    3 Discount\n No Hygrometers\n"
    assert_output(output) {sr.summary("./data/therml.csv")}
  end
end