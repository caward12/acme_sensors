require_relative 'test_helper'
require_relative '../lib/results'

class ResultsTest < Minitest::Test
  def test_it_has_files_from_directory
    current_dir = Dir.pwd #users current working directory
    results = Results.new("#{current_dir.split(Dir.home)[1]}/data") #pass in directory path from root

    assert_equal 3, results.files.count
  end

  def test_it_knows_when_there_are_no_files
    current_dir = Dir.pwd #users current working directory
    results = Results.new("#{current_dir.split(Dir.home)[1]}/lib")

    assert results.files.empty?
  end
end