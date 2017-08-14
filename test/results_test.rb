require_relative 'test_helper'
require_relative '../lib/results'

class ResultsTest < Minitest::Test
  def test_it_has_files_from_directory
    results = Results.new("turing/jobs/acme_sensors/data")

    assert_equal ["/Users/colleenward/turing/jobs/acme_sensors/data/hygrol.csv", "/Users/colleenward/turing/jobs/acme_sensors/data/mix.csv", "/Users/colleenward/turing/jobs/acme_sensors/data/therml.csv"], results.files
  end

end